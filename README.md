# Curry

A simple implementation of [curry()](http://en.wikipedia.org/wiki/Currying) in [Dart](http://dartlang.org). This could probably be cleaner, so please send suggestions and pull requests.

Given a function that takes multiple arguments:

```dart
add(x, y, z) {
  return x + y + z;
}
```

The primary interface is `Curry.make()`. It will return a version of the function that takes one argument:

```dart
var curried = Curry.make(add, 1, 2);
curried(3); // => 6
```

If an insufficient number of arguments is supplied on the initial curry, calling the curried function will return another function of one argument:

```dart
var curried_1 = Curry.make(add, 1);
var curried_1_10 = curried_1(10);
curried_1_10(10); // => 21
```

This library originated from a series of blog posts exploring the functional nature of Dart:

 * [Baby Steps Towards Currying in Dart](http://japhr.blogspot.com/2013/11/baby-steps-towards-currying-in-dart.html)
 * [Basic Currying Function in Dart](http://japhr.blogspot.com/2013/11/basic-currying-function-in-dart.html)
 * [WARNING: Possible call() abuse in Dart](http://japhr.blogspot.com/2013/11/warning-possible-call-abuse-in-dart.html)
 * [Real, Live Currying of Dart Functions](http://japhr.blogspot.com/2013/11/real-live-currying-of-dart-functions.html)


##License

This software is licensed under the MIT License.

Copyright Chris Strom, 2013.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
