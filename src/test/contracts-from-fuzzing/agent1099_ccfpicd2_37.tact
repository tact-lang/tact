struct Sub {
  x: Int;
}

struct Top {
  s: Sub;
}

contract ComposeInit {
  f: Top;

  init() {
    self.f = Top{
      s: Sub{ x: 99 }
    };
  }
}