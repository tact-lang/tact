struct C {
 x: Int?; y: Int;
}

struct B {
 a: Int;
 c: C;
}

struct A {
 b: B;
}

contract MixedNullable {
  data: A;
  init() {
    self.data = A{
      b: B{ a: 1, c: C{ x: null, y: 2 } }
    };
  }
}