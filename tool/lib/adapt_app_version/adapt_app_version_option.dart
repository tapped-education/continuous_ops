import 'package:args/args.dart';

class AdaptAppVersionOption {
  static const String _versionParam = "version";

  final String version;

  AdaptAppVersionOption._({
    required this.version,
  });

  factory AdaptAppVersionOption.fromArguments(List<String> arguments) {
    final parser = ArgParser()..addOption(_versionParam, defaultsTo: "1.0.0");

    final argResults = parser.parse(arguments);

    return AdaptAppVersionOption._(
      version: argResults[_versionParam] as String,
    );
  }
}
