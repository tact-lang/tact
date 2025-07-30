struct X { a: Int; }
struct Y { b: Bool; }
struct Z { c: String; }

contract ManyNestedStructs {
  x: X;
  y: Y;
  z: Z;
  init() {
    self.x = X{ a: 1 };
    self.y = Y{ b: false };
    self.z = Z{ c: "hi" };
  }
}