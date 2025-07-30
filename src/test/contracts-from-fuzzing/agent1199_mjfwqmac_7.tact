contract Test7 {
  i: Int = 0;
  s: String = "";
  b: Bool = false;
  optInt: Int?;
  optStr: String?;
  optBool: Bool?;
  arr: Cell;

  init() {
    self.optInt = null;
    self.optStr = null;
    self.optBool = null;
    self.arr = emptyCell();
  }
}