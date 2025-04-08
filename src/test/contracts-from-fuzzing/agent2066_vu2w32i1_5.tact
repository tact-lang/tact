contract MixedTypes {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;

  init() {
    self.intVal = 100;
    self.boolVal = true;
    self.strVal = "Test";
    self.cellVal = emptyCell();
  }
}