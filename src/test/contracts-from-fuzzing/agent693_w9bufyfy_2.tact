struct Inner {
  x: Int as uint32;
  y: Bool;
  s: String = "s";
  optz: Int?;
}

contract Test {
  data: Inner;

  init() {
    self.data = Inner{ x: 42, y: true, s: "test", optz: null };
  }

  receive() {
    self.data = Inner{ x: self.data.x + 1, y: false, s: "", optz: 1 };
  }
}
