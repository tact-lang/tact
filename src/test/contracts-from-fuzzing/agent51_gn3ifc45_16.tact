struct OptionWrap {
  i: Int?;
}

struct OuterWrap {
  ow: OptionWrap?;
}

contract NullableNullable {
  val: OuterWrap?;
  init() {
    self.val = OuterWrap{ ow: OptionWrap{ i: null } };
  }
}
