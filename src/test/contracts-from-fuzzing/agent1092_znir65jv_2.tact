struct Inner {
  x: Int;
  y: Bool;
}

struct Mid {
  inner: Inner;
  flag: Bool;
}

contract DeepNested {
  data: Mid;

  init() {
    self.data = Mid{
      inner: Inner{
        x: 7,
        y: false
      },
      flag: true
    };
  }
}
