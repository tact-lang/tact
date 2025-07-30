struct Child {
  s: String;
  f: Bool;
}

struct Middle {
  num: Int;
  child: Child;
}

contract WithStrings {
  info: Middle;

  init() {
    self.info = Middle{ num: 11, child: Child{ s: "yo", f: false } };
  }
}
