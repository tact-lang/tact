contract ManyOptional {
  x1: Int?;
  x2: Bool?;
  x3: String?;
  x4: Cell?;
  x5: Slice?;
  x6: Address?;
  y1: Int = 1;
  y2: Bool = true;
  y3: String = "hi";
  y4: Cell;
  y5: Slice;
  y6: Address;

  init() {
    self.x1 = null;
    self.x2 = null;
    self.x3 = null;
    self.x4 = null;
    self.x5 = null;
    self.x6 = null;
    self.y1 = 1;
    self.y2 = true;
    self.y3 = "hi";
    self.y4 = emptyCell();
    self.y5 = emptyCell().asSlice();
    self.y6 = myAddress();
  }
}