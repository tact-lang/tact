struct OptionalDeep {
  s1: Int?;
  s2: String?;
  s3: Bool?;
}

struct HasOptDeep {
  d1: OptionalDeep?;
}

contract NestedOptionalDeep {
  val: HasOptDeep;

  init() {
    self.val = HasOptDeep{ d1: null };
  }
}