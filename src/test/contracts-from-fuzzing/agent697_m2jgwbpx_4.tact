struct Nested {
  inn: Inner;
  flag: Bool;
}

struct Inner {
  x: Int;
  y: String;
  opt: Bool?;
}

contract Test {
  val: Nested = Nested{inn: Inner{ x: 1, y: "ok", opt: null }, flag: false};

  init() {
    self.val = Nested{inn: Inner{ x: 5, y: "hi", opt: true }, flag: true};
  }

  receive() {}
}
