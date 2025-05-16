struct HasStringSliceBuilder {
  s: String;
  sl: Slice;
  b: Builder;
}
contract ComplexFieldTypes {
  c: HasStringSliceBuilder;
  init() {
    self.c = HasStringSliceBuilder{
      s:"hi",
      sl: emptyCell().asSlice(),
      b: beginCell()
    };
  }
}