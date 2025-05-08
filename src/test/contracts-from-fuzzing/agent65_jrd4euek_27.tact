struct NullableBase {
  item: Int?;
}

contract OptionalInBase {
  data: NullableBase?;
  init() {
    self.data = null;
  }
}