struct Inside {
  a: Int;
  b: Bool?;
}

contract EdgeCase {
  value: Int;
  nested: Inside;
  flag: Bool?;
  text: String;
  reference: Cell;

  init() {
    self.value = 42;
    self.nested = Inside{ a:7, b:null };
    self.flag = null;
    self.text = "Test";
    self.reference = emptyCell();
  }
}