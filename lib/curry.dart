library curry;

import 'dart:mirrors';

class Curry {
  // The default instance, aliased as make
  static final Curry currier = new Curry._internal();
  static get make => currier;

  // Singleton. There is never a need for multiple instances of Curry
  factory Curry() {
    return currier;
  }
  Curry._internal();

  // Support call() so that instances can behave as functions
  noSuchMethod(args) {
    if (args.memberName == #send || args.memberName == #call) {
      return _curry(args.positionalArguments);
    }

    return super.noSuchMethod(args);
  }

  _curry(args) {
    // The first argument is the function being curried
    var fn = args[0];
    // The remaining arguments are the bound parameters
    var bound = args.sublist(1);
    // Reflect to determine the number of arguments
    ClosureMirror cm = reflect(fn);
    var size = cm.function.parameters.length;

    // Return a function that takes a single argument
    return (_) {
      // The arguments supplied to the orginal function that is being
      // curried. The list is the combination of existing, bound arguments, and
      // the new, single argument being supplied.
      var _args = [_]..addAll(bound);

      // If the number of arguments is not the same as the number of parameters
      // the function expects, return another curry.
      if (_args.length < size) {
        var im = reflect(this);
        return im.invoke(#send, [fn]..addAll(_args)).reflectee;
      }

      // Apply the curried function with the supplied arguments.
      return Function.apply(fn, _args);
    };
  }
}
