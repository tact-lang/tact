struct ManyLevels {
  x: Int;
  y: Int?;
  z: Bool;
}

struct Enc1 {
  m: ManyLevels;
  opt: ManyLevels?;
}

struct Enc2 {
  e1: Enc1;
  e2: Enc1?;
}

contract DeepOption {
  val: Enc2;

  init() {
    self.val = Enc2{
      e1: Enc1{ m: ManyLevels{ x:1, y:2, z:true }, opt:null },
      e2: null
    };
  }
}