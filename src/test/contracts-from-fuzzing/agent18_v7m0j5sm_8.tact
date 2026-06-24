struct MultiOpt {
  a: Int?;
  b: Int?;
  c: Int?;
}

struct Wrap {
  inner: MultiOpt?;
}

contract DeepOptionals {
  data: Wrap;

  init() {
    self.data = Wrap{ inner: null };
  }
}