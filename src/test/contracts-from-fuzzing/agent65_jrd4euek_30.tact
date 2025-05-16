struct DeeplyMixed {
  a: Int;
  b: Mid1;
  c: Mid1?;
}

struct Mid1 {
  x: Int;
  y: DeepOpt?;
}

struct DeepOpt {
  inner: InnerMost;
}

struct InnerMost {
  v: Int;
}

contract FuzzMix {
  store: DeeplyMixed;
  init() {
    self.store = DeeplyMixed{
      a: 45,
      b: Mid1{
        x:5,
        y:null
      },
      c:null
    };
  }
}