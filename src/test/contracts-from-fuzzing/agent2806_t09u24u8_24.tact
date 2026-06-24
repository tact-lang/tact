struct AllFields {
 a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
}

contract FieldsCombo {
  combo: AllFields;

  init() {
    self.combo = AllFields{
      a: 1, b: false, c: "c", d: 4, e: null, f: true
    };
  }
}