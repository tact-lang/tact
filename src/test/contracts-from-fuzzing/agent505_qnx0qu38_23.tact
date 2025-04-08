struct S1 {
  x: Int;
  y: Bool;
}

struct S2 {
  s1a: S1;
  s1b: S1;
}

contract StructsInStruct {
  pair: S2 = S2{
    s1a: S1{ x:1, y:true },
    s1b: S1{ x:2, y:false }
  };

  init() {
    self.pair = self.pair;
  }

  receive() {
    self.pair = self.pair;
  }
}