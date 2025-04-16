struct V {
  a: Int;
}

struct W {
  b: V?;
}

contract OptionalStructField {
  data: W;

  init() {
    self.data = W {
      b: null
    };
  }
}