struct Mixed {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
}

contract ComboStruct {
  d: Mixed;
  init() {
    self.d = Mixed{
      intVal: 123,
      boolVal: false,
      strVal: "abc",
      cellVal: emptyCell()
    };
  }
}