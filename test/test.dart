import 'package:unittest/unittest.dart';
import 'package:curry/curry.dart';


add(x, y, z) {
  return x + y + z;
}

main() {
  group("Curry", (){
    test('new instance can curry', (){
      var currier = new Curry();
      var curried_1_1 = currier.send(add, 1, 1);
      expect(curried_1_1(1), 3);
    });

    test('currier.send() static property can curry', (){
      var currier = Curry.currier;
      var curried_1_1 = currier.send(add, 1, 1);
      expect(curried_1_1(1), 3);
    });

    test('make.send() static property can curry', (){
      var curried = Curry.make.send(add, 1, 2);
      expect(curried(3), 6);
    });

    test('make() static property / function can curry', (){
      var curried = Curry.make(add, 1, 2);
      expect(curried(3), 6);
    });

    test('one bound variable returns another curried function', (){
      var curried_1 = Curry.make(add, 1);
      expect(curried_1(2)(3), 6);
    });

    test('intermediate curried function', (){
      var curried_1 = Curry.make(add, 1);
      var curried_1_10 = curried_1(10);
      //curried_1_10(10); // => 21
      expect(curried_1_10(10), 21);
    });
  });
}
