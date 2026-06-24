struct InnerDeep {
  val: Int;
}

struct MiddleDeep {
  inner: InnerDeep;
}

struct OuterDeep {
  middle: MiddleDeep;
}

contract ManyLayered {
  storage: OuterDeep;

  init() {
    self.storage = OuterDeep{
      middle: MiddleDeep{
        inner: InnerDeep{ val: 123 }
      }
    };
  }
}