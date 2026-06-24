contract SerializationMinimums {
  small: Int as uint1;
  negtiny: Int as int1;

  init() {
    self.small = 1;
    self.negtiny = 0;
  }
}