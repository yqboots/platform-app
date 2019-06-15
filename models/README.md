# models

Platform Models

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 使用json_serializer自动生成序列化和反序列化代码

### 一次性生成
``
flutter packages pub run build_runner build --delete-conflicting-outputs

``
### 持续生成
``
flutter packages pub run build_runner watch   //
