struct NullableStr {
  txt: String?;
}

contract NullableStrTest {
  data: NullableStr;

  init() {
    self.data = NullableStr{ txt: null };
  }
}