struct Deep3 {
  z: Int;
}

struct Deep2 {
  y: Deep3;
}

struct Deep1 {
  x: Deep2;
}

contract DeeplyNestedStruct {
  datum: Deep1;

  init() {
    self.datum = Deep1{
      x: Deep2{
        y: Deep3{ z: 5 }
      }
    };
  }
}