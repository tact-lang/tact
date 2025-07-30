struct NestedWithOptionals {
  s: String?;
  b: Bool?;
  a: Address?;
}

contract NestedOptionalsFields {
  nest: NestedWithOptionals;

  init() {
    self.nest = NestedWithOptionals{ s: null, b: null, a: null };
  }
}