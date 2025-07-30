struct DeepOption {
  a: Int?;
  b: Bool?;
  s: String;
}

struct Wrap {
  d: DeepOption?;
  z: Int;
}

contract OptionalField {
  val: Wrap;

  init() {
    self.val = Wrap{
      d: null,
      z: 99
    };
  }
}
