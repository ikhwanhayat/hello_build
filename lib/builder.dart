import 'dart:async';
import 'package:build/build.dart';

/// Factory class for CopyBuilder. This will be called during build (see build.yaml)
Builder copyBuilder(BuilderOptions options) =>
    new CopyBuilder(".copy");

/// A really simple [Builder], it just makes copies!
/// This code is taken from https://pub.dartlang.org/packages/build
class CopyBuilder implements Builder {
  final String extension;

  CopyBuilder(this.extension);

  Future build(BuildStep buildStep) async {

    /// Each [buildStep] has a single input.
    var inputId = buildStep.inputId;

    /// Create a new target [AssetId] based on the old one.
    var copy = inputId.addExtension(extension);
    var contents = await buildStep.readAsString(inputId);

    /// Write out the new asset.
    ///
    /// There is no need to `await` here, the system handles waiting on these
    /// files as necessary before advancing to the next phase.
    buildStep.writeAsString(copy, contents);
  }

  /// Configure output extensions. All possible inputs match the empty input
  /// extension. For each input 1 output is created with `extension` appended to
  /// the path.
  Map<String, List<String>> get buildExtensions =>  {'.dart': [ ".dart$extension" ]};
}