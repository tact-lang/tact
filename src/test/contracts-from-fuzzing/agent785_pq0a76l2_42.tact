// Deep nested struct with *many* serialization annotations
struct InnerMost {
  f1: Int as uint3;
  f2: Int as int5;
}

struct Inner2 {
  i: InnerMost;
  j: Int as uint8;
}

struct Inner1 {
  x: Int as int16;
  y: Inner2;
}

contract DeepAnnots {
  store: Inner1;
  init() {
    self.store = Inner1{
      x: -1234,
      y: Inner2{
        i: InnerMost{
          f1: 5,
          f2: -10
        },
        j: 255
      }
    };
  }
}
