struct Entity {
  id: Int;
  flag: Bool;
}

contract OptStructField {
  e: Entity?;

  init() {
    self.e = null;
  }
}