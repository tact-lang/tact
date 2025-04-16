contract OnlyOptional {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Address?;
  o5: Cell?;

  init() {
    self.o1 = null; self.o2 = null; self.o3 = null; self.o4 = null; self.o5 = null;
  }
}