contract WeirdInitOptional {
  a: Int?;

  init() {
    self.a = 5;
    self.a = null;
  }
}