import 'dart:async';
import 'dart:io';
import 'package:tool/adapt_app_version/adapt_app_version_option.dart';

Future<void> main(List<String> arguments) async {
  final option = AdaptAppVersionOption.fromArguments(arguments);

  stdout.writeln("Version changed: ${option.version.toString()}");
}
