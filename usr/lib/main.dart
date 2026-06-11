import 'package:flutter/material.dart';
import 'story_data.dart';

void main() {
  runApp(const NovelReaderApp());
}

class NovelReaderApp extends StatelessWidget {
  const NovelReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仙侠阅读器',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 宽屏幕自适应适配
    return Scaffold(
      appBar: AppBar(
        title: const Text('仙侠奇缘'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: storyChapters.length,
            itemBuilder: (context, index) {
              final chapter = storyChapters[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  title: Text(
                    chapter['title']!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingScreen(chapter: chapter),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ReadingScreen extends StatelessWidget {
  final Map<String, String> chapter;
  const ReadingScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1E7), // 护眼仿纸质背景色
      appBar: AppBar(
        title: Text(chapter['title']!, style: const TextStyle(color: Color(0xFF4A4A4A))),
        backgroundColor: const Color(0xFFE8DCC4),
        iconTheme: const IconThemeData(color: Color(0xFF4A4A4A)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Text(
                  chapter['content']!,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.8, // 舒适的行距
                    letterSpacing: 0.5,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
