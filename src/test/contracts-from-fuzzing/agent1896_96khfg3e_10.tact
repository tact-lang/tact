struct BoolNest {
  inner: BoolOpt;
}

struct BoolOpt {
  val: Bool?;
}

contract OptionalBoolNested {
  field: BoolNest;

  init() {
    self.field = BoolNest{
      inner: BoolOpt{ val: null }
    };
  }
}