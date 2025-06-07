struct WeirdOrder {
  a: Int as uint4;
  b: Int as int257;
  c: Int as uint1;
  d: Int as int64;
  e: Int as uint3;
}

contract OrderPreservation {
  x: WeirdOrder;

  init() {
    self.x = WeirdOrder{ a:3,b:5,c:1,d:7,e:2 };
  }
}
