struct IntsAndStrs {
  aa: Int;
  bb: String;
  cc: String?;
  dd: Int?;
  ee: Bool;
}

contract ComboData {
  combo: IntsAndStrs;

  init() {
    self.combo = IntsAndStrs{
      aa: -5, bb: "q", cc: null, dd: 42, ee: true
    };
  }
}