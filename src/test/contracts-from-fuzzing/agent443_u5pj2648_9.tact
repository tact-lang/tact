struct OptionRecord {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract NullDefaults {
  rec: OptionRecord;

  init() {
    self.rec = OptionRecord{a: null, b: null, c: null};
  }
}