struct OneField {
  x: Int;
}

struct TwoFields {
  a: OneField;
  b: OneField;
}

struct ThreeFields {
  f: TwoFields;
  g: Bool;
  h: String;
}

contract DeepChain {
  s: ThreeFields;
  init() {
    self.s = ThreeFields{
      f: TwoFields{ a: OneField{x:1}, b: OneField{x:2} },
      g: true,
      h: "hi",
    };
  }
}