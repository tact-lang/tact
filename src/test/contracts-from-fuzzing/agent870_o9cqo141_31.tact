struct EmbedSliceBuilder {
  sl: Slice;
  bl: Builder;
}

contract EmbedSBTest {
  v: EmbedSliceBuilder;
  init() {
    self.v = EmbedSliceBuilder{ sl: emptyCell().asSlice(), bl: beginCell() };
  }
}