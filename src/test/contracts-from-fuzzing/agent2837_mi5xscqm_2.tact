struct NestedOptional {
  maybe: Int?;
}

contract TestOptionalNested {
  data: NestedOptional;
  init() {
    self.data = NestedOptional{ maybe: null };
  }
}