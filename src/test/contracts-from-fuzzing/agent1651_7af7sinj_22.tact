contract ManyOptionals {
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Bool?;
  o5: String?;

  init() {
    self.o1 = null;
    self.o2 = 5;
    self.o3 = null;
    self.o4 = true;
    self.o5 = "hi";
  }
}