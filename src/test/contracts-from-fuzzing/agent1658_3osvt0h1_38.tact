struct I1 { x:Int; }
struct I2 { y:Int; }
struct I3 { z:Int; }

struct BigNest {
  a:I1;
  b:I2;
  c:I3;
}

struct Container2 {
  nested: BigNest;
}

contract DoubleBigNest {
  f:Container2;
  init() {
    self.f = Container2{ nested: BigNest{ a:I1{x:1},b:I2{y:2},c:I3{z:3} } };
  }
}