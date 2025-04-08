struct SInnermost {
  i: Int;
  b: Bool;
}

struct SMid {
  a: SInnermost;
  b: Int;
}

struct SOut {
  x: SMid;
  y: Bool;
}

contract DeepNest2 {
  s: SOut;

  init() {
    self.s = SOut{
      x: SMid{ a: SInnermost{ i: 3, b: true }, b: 4 },
      y: false
    };
  }
}
