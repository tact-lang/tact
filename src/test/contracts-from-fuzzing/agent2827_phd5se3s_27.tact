struct OStruct {
  a: Int?;
  b: String?;
}

contract NestedManyOptional {
  outer: OStruct?;
  init() {
    self.outer = null;
  }
}
