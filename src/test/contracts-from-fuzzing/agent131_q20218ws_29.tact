struct SubField {
  a: Int?;
  b: Int;
}

contract OptStructAndPrim {
  optS: SubField?;
  val: Int;

  init() {
    self.optS = null;
    self.val = 3;
  }
}