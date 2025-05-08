contract NullableChain {
  first: Int?;
  second: Int?;
  third: Int?;

  init() {
    self.first = 1;
    self.second = self.first;
    self.third = self.second;
  }
}