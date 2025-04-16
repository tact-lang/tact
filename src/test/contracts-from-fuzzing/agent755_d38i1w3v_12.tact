struct X { x: Int; }
struct Y { y: Int; }
struct Z { z: Int; }

contract MultiType {
  a: X;
  b: Y;
  c: Z;

  init() {
    self.a = X{x:1};
    self.b = Y{y:2};
    self.c = Z{z:3};
  }
}