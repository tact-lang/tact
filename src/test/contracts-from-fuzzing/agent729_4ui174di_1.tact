struct Inner {
  a: Int;
  b: String?;
  c: Cell;
}

contract TestContract {
  nested: Inner;
  num: Int;
  flag: Bool;
  text: String;
  optNum: Int?;
  bigNum: Int as int256;
  smallNum: Int as uint8;
  dataCell: Cell;
  textOpt: String?;

  init() {
    self.nested = Inner{a: 1, b: null, c: emptyCell()};
    self.num = 123;
    self.flag = true;
    self.text = "abc";
    self.optNum = null;
    self.bigNum = -999;
    self.smallNum = 7;
    self.dataCell = emptyCell();
    self.textOpt = null;
  }
}
