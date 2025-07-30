struct SInner {
  x: Int;
  y: Bool;
}

struct SOuter {
  inner: SInner;
  z: String;
}

contract NestedStruct {
  s: SOuter;

  init() {
    self.s = SOuter{
      inner: SInner{ x:1, y:true },
      z: "hello",
    };
  }
}