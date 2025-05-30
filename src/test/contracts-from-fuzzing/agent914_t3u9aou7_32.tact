struct Deep1 {
  x: Int?;
  y: Bool;
}

struct Deep2 {
  d1: Deep1;
  y: Int?;
}

struct Deep3 {
  d2: Deep2;
  z: Bool;
}

contract DeepOpt {
  d: Deep3;
  init() {
    self.d = Deep3{
      d2: Deep2{
        d1: Deep1{x:null,y:true},
        y: 42
      },
      z:false
    };
  }
}