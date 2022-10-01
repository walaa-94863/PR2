import 'package:flutter/material.dart';

class UnbordingContent {
  String image;
  String title;

  UnbordingContent({required this.image, required this.title});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: "Find Your Flight Easily",
    image: 'assets/images/photo.jpeg',
  ),
  UnbordingContent(
    title: 'All going and coming Flights',
    image: 'assets/images/photo1.jpeg',
  ),
  UnbordingContent(
    title: 'Control Where \nYOU\nWant To Go Fast',
    image: 'assets/images/photo3.jpeg',
  ),
];
