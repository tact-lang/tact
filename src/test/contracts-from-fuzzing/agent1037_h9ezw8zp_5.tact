struct Payload { a: Int; b: Bool; }

contract OptStructField {
  data: Payload?;

  init() {
    self.data = null;
  }
}