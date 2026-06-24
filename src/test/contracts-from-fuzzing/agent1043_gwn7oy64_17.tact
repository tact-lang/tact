struct NestedDefaultOpt {
  a: Int?;
  b: Bool?;
}

contract TestContract {
  nested: NestedDefaultOpt;

  init() {
    self.nested = NestedDefaultOpt{ a: null, b: null };
  }
}