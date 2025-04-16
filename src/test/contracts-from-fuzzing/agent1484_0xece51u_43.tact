struct Layered {
  a: Int;
  b: Bool;
  c: String;
}

contract DefaultStructInit {
  s: Layered = Layered{ a: 5, b: true, c: "hi" };

  init() {
    self.s = Layered{ a: 10, b: false, c: "bye" };
  }
}