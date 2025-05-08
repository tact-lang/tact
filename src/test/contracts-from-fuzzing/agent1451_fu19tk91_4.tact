struct Inner {
  a: Int?;
  b: Bool;
}

struct Mid {
  inner: Inner?;
  num: Int;
}

contract DeepOptionals {
  m: Mid = Mid{
    inner: null,
    num: 5,
  };

  receive() {
    self.m = self.m;
  }
}