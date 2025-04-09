struct SNestedOpt {
  inner: Int?;
  strOpt: String?;
  boolOpt: Bool?;
}

contract NestedOptionals {
  nest: SNestedOpt?;

  init() {
    self.nest = null;
  }
}