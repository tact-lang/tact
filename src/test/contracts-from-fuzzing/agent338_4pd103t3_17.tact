struct Tiny {
  v1: Int as uint4;
  v2: Int as uint8;
}

struct Nano {
  a: Tiny?;
  b: Int as int16;
}

contract TestContract {
  data: Nano;

  init() {
    self.data = Nano{
      a: null,
      b: -10
    };
  }
}