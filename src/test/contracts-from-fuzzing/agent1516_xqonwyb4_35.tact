struct Sub {
  a: Int;
}

struct Mid {
  sub: Sub?;
}

struct Top {
  mid: Mid?;
}

contract OptionalStructField {
  state: Top;

  init() {
    self.state = Top{
      mid: null
    };
  }
}