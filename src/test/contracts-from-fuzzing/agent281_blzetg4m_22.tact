// Nested default values mixed with optionals
struct Inner {
  a: Int? = null;
  b: Bool? = null;
}

struct Outer {
  in1: Inner;
  in2: Inner;
}

contract NestedOptDefaults {
  state: Outer;

  init() {
    self.state = Outer{
      in1: Inner{},
      in2: Inner{}
    };
  }
}