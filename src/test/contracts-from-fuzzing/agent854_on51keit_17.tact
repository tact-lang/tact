struct Embedded {
  x: Int;
}

contract OptionalEmbedded {
  val: Embedded?;

  init() {
    self.val = Embedded{ x: 1024 };
  }
}