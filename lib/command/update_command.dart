import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cue_cli/helper/logs.dart';

class UpdateCommand extends Command {
  @override
  String get description => "Update the project";

  @override
  String get name => "Check for updates and update the CLI tool";

  @override
  Future<void> run() async {
    final result = await Process.run('dart', [
      'pub',
      'global',
      'activate',
      'my_cli',
    ], runInShell: true);

    // Log the standard output with info level
    if (result.stdout.toString().trim().isNotEmpty) {
      Logs.i(result.stdout);
    }

    // Log errors with error level
    if (result.stderr.toString().trim().isNotEmpty) {
      Logs.e(result.stderr);
    }

    // Exit with the same code as the process
    if (result.exitCode != 0) {
      Logs.e('Update failed with exit code ${result.exitCode}');
      exit(result.exitCode);
    }

    Logs.i('my_cli has been updated to the latest version!');
  }
}
