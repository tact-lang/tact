struct Inner {
  x: Int;
}

struct Mid {
  y: Inner;
}

contract DeepInit {
  data: Mid;

  init() {
    self.data = Mid{ y: Inner{ x: 7 } };
  }
}
