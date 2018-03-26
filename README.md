# hello_build

This was an exercise to understand how to use Dart's `build` package.

https://pub.dartlang.org/packages/build
https://github.com/dart-lang/build

Basically, what needs to be done is:

1. Add the needed dependencies in `pubspec.yaml`. We will need packages `build` and `build_runner`.
1. Create a builder class. Then create a factory function that will instantiate the class. See file `/lib/builder.dart`
1. Create a `build.yaml` file that specifies the targets and builders.
1. Run the build using pub and build_runner, with command `pub run build_runner build`.
1. You will then see the generated files located in `.dart_tool` directory.