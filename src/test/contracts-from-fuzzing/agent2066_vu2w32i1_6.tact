contract ManyOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Cell?;
  o5: Slice?;

  init() {
    self.o1 = 1;
    self.o2 = false;
    self.o3 = null;
    self.o4 = null;
    self.o5 = null;
  }
}