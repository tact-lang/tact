struct Inner {
  v1: Int;
  v2: Int;
}

struct Outer {
  in1: Inner;
  in2: Inner;
}

contract DoublyNested {
  d: Outer;

  init() {
    self.d = Outer{
      in1: Inner{v1:1,v2:2},
      in2: Inner{v1:3,v2:4}
    };
  }
}
