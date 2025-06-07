struct DeepOptional {
  inner: Int?;
}

struct MidOptional {
  nested: DeepOptional?;
}

struct OuterOptional {
  mid: MidOptional?;
}

contract OptInOpt {
  val: OuterOptional;
  init() {
    self.val = OuterOptional{ mid: null };
  }
}