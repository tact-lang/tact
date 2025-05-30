struct Deep {
  level: Int;
}

struct MidOptional {
  mid: Deep?;
}

struct OuterOpt {
  outer: MidOptional?;
}

contract NestedOptionalLayers {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{ outer: null };
  }
}