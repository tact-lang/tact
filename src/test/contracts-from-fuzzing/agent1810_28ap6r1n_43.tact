contract ComboOptional {
  i: Int = 1;
  optI: Int?;
  b: Bool = false;
  optB: Bool?;
  s: String = "S";
  optS: String?;

  init() {
    self.optI = null;
    self.optB = null;
    self.optS = null;
  }
}