struct Mid {
  num: Int;
  txt: String;
}

struct OuterWithOptionalInner {
  mid: Mid?;
}

contract OptionalMidStruct {
  outer: OuterWithOptionalInner;

  init() {
    self.outer = OuterWithOptionalInner{ mid: null };
  }
}