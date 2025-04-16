struct NestedStruct {
  s1: Int?;
  s2: String;
  s3: Bool;
}

contract OptionalNested {
  s: NestedStruct?;

  init() {
    self.s = null;
  }
}