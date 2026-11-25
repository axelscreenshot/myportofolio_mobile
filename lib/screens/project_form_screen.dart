import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _thumbnail = '';
  String _view = '';
  String _source = '';
  bool _isSubmitting = false;

  String? _validateUrl(String? value, {required bool isRequired}) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return isRequired ? 'URL tidak boleh kosong!' : null;
    }

    final uri = Uri.tryParse(trimmed);
    final hasValidScheme =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    final hasValidHost = uri != null && uri.host.isNotEmpty;

    if (!hasValidScheme || !hasValidHost) {
      return 'Masukkan URL yang valid (diawali http:// atau https://).';
    }
    return null;
  }

  Future<void> _submit() async {
    if (_isSubmitting || !_formKey.currentState!.validate()) {
      return;
    }

    final loggedIn = await ensureLoggedIn(context);
    if (!loggedIn || !mounted) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final title = _title.trim();
    final description = _description.trim();
    final thumbnail = _thumbnail.trim();
    final view = _view.trim();
    final source = _source.trim();

    try {
      final authState = context.read<AuthState>();
      final token = authState.token;

      if (token == null || token.isEmpty) {
        if (!mounted) return;
        final loggedIn = await ensureLoggedIn(context);
        if (!loggedIn || !mounted) return;
      }

      final activeToken = context.read<AuthState>().token;
      if (activeToken == null || activeToken.isEmpty) {
        return;
      }

      final newProject = Project(
        title: title,
        description: description,
        thumbnail: thumbnail,
        view: view,
        source: source,
      );

      await context.read<ApiClient>().createProject(
        newProject,
        token: activeToken,
      );

      if (!mounted) return;

      await showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Proyek berhasil ditambahkan!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Title: $title'),
                  const SizedBox(height: 4),
                  Text('Description: $description'),
                  if (thumbnail.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('Thumbnail URL: $thumbnail'),
                  ],
                  if (view.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('View URL: $view'),
                  ],
                  if (source.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('Source URL: $source'),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  _formKey.currentState?.reset();
                  setState(() {
                    _title = '';
                    _description = '';
                    _thumbnail = '';
                    _view = '';
                    _source = '';
                  });
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Sesi berakhir (401). Silakan login ulang.'),
            ),
          );
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                e.message.isNotEmpty
                    ? e.message
                    : 'Gagal menambahkan proyek (${e.statusCode}).',
              ),
            ),
          );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Project Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Judul Proyek",
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _title = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Title tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Proyek",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _description = value,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/thumbnail.png (opsional)',
                    labelText: 'Thumbnail URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _thumbnail = value,
                  validator: (value) => _validateUrl(value, isRequired: false),
                ),
              ),

              // === View URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/ (opsional)',
                    labelText: 'View URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _view = value,
                  validator: (value) => _validateUrl(value, isRequired: false),
                ),
              ),

              // === Source URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://github.com/example/repo (opsional)',
                    labelText: 'Source URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _source = value,
                  validator: (value) => _validateUrl(value, isRequired: false),
                ),
              ),

              const SizedBox(height: 12),

              // === Tombol Simpan ===
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                  ),
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
