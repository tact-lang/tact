struct WrapString {
  s: String;
}

struct Contain {
  one: Int;
  s: WrapString;
  t: String;
}

contract Test {
  data: Contain;
  init() {
    self.data = Contain{
      one: 1,
      s: WrapString{s: "abc"},
      t: "def"
    };
  }
}