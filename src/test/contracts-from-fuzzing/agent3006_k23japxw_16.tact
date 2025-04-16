struct Mid {
  x: Int;
  y: Bool;
  z: String?;
}

struct Top {
  m1: Mid;
  m2: Mid;
  m3: Mid;
}

contract ThreeNestedStructs {
  top: Top;

  init() {
    self.top = Top{
      m1: Mid{ x:1, y:true, z:"x" },
      m2: Mid{ x:2, y:false, z:null },
      m3: Mid{ x:3, y:true, z:"z" },
    };
  }
}
