import 'package:flutter/material.dart';

import 'application.dart';
import 'application_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Application>> futureApplications;

  @override
  void initState() {
    super.initState();
    futureApplications = ApplicationService().fetchApplications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications'),
      ),
      body: FutureBuilder<List<Application>>(
        future: futureApplications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No applications found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Application application = snapshot.data![index];
                return ListTile(
                  title: Text(application.name),
                  subtitle: Text(application.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
