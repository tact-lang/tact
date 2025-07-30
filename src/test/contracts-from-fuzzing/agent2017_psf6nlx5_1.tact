struct NestedOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract TestContract {
  data: NestedOptionals;

  init() {
    self.data = NestedOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
    };
  }
}
