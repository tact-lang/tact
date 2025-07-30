contract AllNullables {
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
  opt4: Cell?;
  opt5: Slice?;
  opt6: Address?;

  init() {
    self.opt1 = null;
    self.opt2 = null;
    self.opt3 = null;
    self.opt4 = null;
    self.opt5 = null;
    self.opt6 = null;
  }
}