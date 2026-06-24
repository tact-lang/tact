struct DeeplyNestedOptional {
  s1: Int?;
  s2: String?;
  s3: Cell?;
}

struct MiddleNestedOptional {
  inner: DeeplyNestedOptional?;
  flag: Bool;
}

contract OptionalMix {
  mid: MiddleNestedOptional;

  init() {
    self.mid = MiddleNestedOptional{
      inner: null,
      flag: false
    };
  }
}