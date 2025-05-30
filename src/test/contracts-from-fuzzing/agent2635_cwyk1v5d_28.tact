struct MixNested {
  a: Int;
  b: String?;
  c: Bool;
}

struct Layered {
  x: MixNested;
  y: MixNested;
}

contract MixLayer {
  z: Layered;

  init() {
    self.z = Layered{
      x: MixNested{ a:1, b:null, c:true },
      y: MixNested{ a:2, b:null, c:false }
    };
  }
}