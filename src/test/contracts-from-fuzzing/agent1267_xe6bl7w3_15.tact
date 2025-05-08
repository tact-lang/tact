struct In1 {
  x: Int;
}

struct In2 {
  y: Int;
}

struct Holder {
  a: Int;
  ref1: In1;
  ref2: In2;
}

contract MultiRef {
  h: Holder;
  init() {
    self.h = Holder{
      a: 100,
      ref1: In1{x:1},
      ref2: In2{y:2}
    };
  }
}
