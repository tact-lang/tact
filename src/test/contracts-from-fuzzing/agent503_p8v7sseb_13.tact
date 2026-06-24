struct Deepest {
  num: Int = 99;
}

struct Mid {
  inner: Deepest;
}

contract DeepPartial2 {
  m: Mid;

  init() {
    self.m = Mid{
      inner: Deepest{}
    };
  }
}
