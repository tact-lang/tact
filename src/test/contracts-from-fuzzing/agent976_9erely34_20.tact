struct LongNames {
  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa: Int = 1;
  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb: Int = 2;
}

contract LongNameFields {
  data: LongNames;
  init() {
    self.data = LongNames{};
  }
}