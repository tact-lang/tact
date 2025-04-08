struct SomeInner {
  data: Int?;
}

contract BadDoubleOptional {
  field: SomeInner?;

  init() {
    self.field = SomeInner{ data: null };
  }
}
