struct In1 {
  v: Int;
}

struct In2 {
  w: Bool;
}

struct Out {
  a: In1;
  b: In2;
}

contract NestedStructFields {
  s: Out;

  init() {
    self.s = Out{
      a: In1{v:1},
      b: In2{w:true},
    };
  }
}
