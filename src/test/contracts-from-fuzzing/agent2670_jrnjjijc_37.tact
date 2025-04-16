struct Outer {
  in1: Int;
  in2: Inner?;
}

struct Inner {
  b: Bool;
  s: String?;
}

contract MixedNested {
  field: Outer;

  init() {
    self.field = Outer{
      in1: 5,
      in2: null
    };
  }
}