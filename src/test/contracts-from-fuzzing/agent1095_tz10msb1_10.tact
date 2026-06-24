struct BigOne {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: InnerS;
}

struct InnerS {
  x: Int;
  y: Bool;
  z: Int?;
}

contract ManyTypes {
  s1: BigOne;
  s2: InnerS;
  s3: BigOne?;

  init() {
    self.s1 = BigOne{
      a: 1,
      b: true,
      c: 3,
      d: null,
      e: InnerS{ x: 2, y: false, z: null }
    };
    self.s2 = InnerS{ x: 5, y: true, z: 6 };
    self.s3 = null;
  }
}