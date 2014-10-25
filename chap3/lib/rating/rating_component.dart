library rating;

import 'package:angular/angular.dart';

@Component(
  selector: 'rating',
  templateUrl: 'packages/angular_sample/rating/rating_component.html',
  cssUrl: 'packages/angular_sample/rating/rating_component.css',
  publishAs: 'ratingCmp',
  map: const{
    'rating' : '<=>rating',
    'max-rating' : '@maxRating'
  })
class RatingComponent {

  get ratingCmp => this;

  static const String _STAR_ON_CHAR = "\u2605";
  static const String _STAR_OFF_CHAR = "\u2606";
  static const String _STAR_ON_CLASS = "star-on";
  static const String _STAR_OFF_CLASS = "star-off";

  static final int DEFAULT_MAX = 5;

  List<int> stars = [];

  int rating;

  void set maxRating(String value) {
    var count = value == null
    ? DEFAULT_MAX
    : int.parse(value, onError: (_) => DEFAULT_MAX);
    stars = new List.generate(count, (i) => i + 1);
  }

  String starClass(int star) =>
  star > rating ? _STAR_OFF_CLASS : _STAR_ON_CLASS;

  String starChar(int star) => star > rating ? _STAR_OFF_CHAR : _STAR_ON_CHAR;

  void handleClick(int star) {
    rating = (star == 1 && rating == 1) ? 0 : star;
  }
}