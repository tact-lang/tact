struct X { a: Int }
struct Y { b: Int }
struct Z { c: Int }

contract ManyStructsVars {
  x: X;
  y: Y;
  z: Z;

  init() {
    self.x=X{a:1}; self.y=Y{b:2}; self.z=Z{c:3};
  }

  receive() {
    let _ = self.x.a + self.y.b + self.z.c;
  }
}