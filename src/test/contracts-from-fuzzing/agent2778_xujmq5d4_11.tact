struct WrappedOptional {
  nested: Int?;
}

contract WrappedOptionalContract {
  data: WrappedOptional;

  init() {
    self.data = WrappedOptional{ nested: null };
  }
}
