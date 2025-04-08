struct EmbedOpt {
  st: Inner?;
}

contract OptionalStructField {
  e: EmbedOpt = EmbedOpt{st: null};

  init() {
      self.e = EmbedOpt{ st: Inner{ x: 5, y: true, s: "x" } };
  }
}

struct Inner {
  x: Int;
  y: Bool;
  s: String;
}