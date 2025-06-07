struct Inner { a: Int; b: Bool; c: String; }

contract MultiTypeNested {
  nested: Inner;

  init() {
    self.nested = Inner{ a: 42, b: true, c: "hi" };
  }
}