struct InnerMost {
  z: Int;
}

struct Inner {
  maybe: InnerMost?;
}

struct Outer {
  nest: Inner;
}

contract DeepOptional {
  field: Outer;

  init() {
    self.field = Outer{
      nest: Inner{
        maybe: null,
      },
    };
  }
}
