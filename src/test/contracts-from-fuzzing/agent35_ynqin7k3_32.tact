struct DeepMid {
  x: Int;
}

struct DeepOuter {
  mid: DeepMid;
}

contract MultiFieldNesting {
  a: DeepOuter;
  b: DeepOuter;
  c: DeepOuter;

  init() {
    self.a = DeepOuter{mid: DeepMid{x:1}};
    self.b = DeepOuter{mid: DeepMid{x:2}};
    self.c = DeepOuter{mid: DeepMid{x:3}};
  }
}