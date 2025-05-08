struct OptStrBool {
  a: String?;
  b: Bool?;
}

contract OptMix2 {
  data: OptStrBool;

  init() {
    self.data = OptStrBool{ a: null, b: null };
  }
}