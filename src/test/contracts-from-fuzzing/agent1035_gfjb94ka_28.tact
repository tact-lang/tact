struct NullableString {
  s: String?;
}

contract OptionalString {
  data: NullableString = NullableString{ s: null };
  init() {
    self.data = NullableString{ s: "hi" };
  }
  receive() {}
}