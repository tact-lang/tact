contract ManyOptional {
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Int?;

  init() {
    self.o1 = null;
    self.o2 = 5;
    self.o3 = null;
    self.o4 = 6;
  }
}