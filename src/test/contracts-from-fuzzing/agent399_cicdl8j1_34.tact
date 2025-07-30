struct DoubleNested {
  x:Int;
  inner: InnerNest;
}

struct InnerNest {
  y:Int;
  str:String;
}

contract DeepFieldAccess {
  s: DoubleNested;

  init() {
    self.s = DoubleNested{
      x:1,
      inner: InnerNest{ y:2, str:"hi" }
    };
  }
}