import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final hasThumbnail = project.thumbnail.trim().isNotEmpty;
    final hasView = project.view.trim().isNotEmpty;
    final hasSource = project.source.trim().isNotEmpty;
    final hasId = (project.id != null && project.id!.trim().isNotEmpty);

    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasThumbnail) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.thumbnail,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 220,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.broken_image_outlined, size: 36),
                          SizedBox(height: 8),
                          Text('Failed to load project thumbnail'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
            Text(
              project.title,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (hasId) ...[
              const SizedBox(height: 4),
              Text(
                'ID: ${project.id}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (hasView || hasSource) ...[
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 12),
              Text(
                'Links',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
            ],
            if (hasView)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.visibility),
                title: const Text('View Project'),
                subtitle: Text(project.view),
              ),
            if (hasSource)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.code),
                title: const Text('Source Code'),
                subtitle: Text(project.source),
              ),
          ],
        ),
      ),
    );
  }
}
