struct Mid {
  x: Int;
  y: Bool;
}

struct Outer {
  inner: Mid;
  opt: String?;
}

contract DefaultInit {
  val: Outer;

  init() {
    self.val = Outer{
      inner: Mid{ x: 1, y: false },
      opt: null,
    };
  }
}