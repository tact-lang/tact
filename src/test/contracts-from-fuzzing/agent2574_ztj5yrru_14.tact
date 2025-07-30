struct BoolString {
  cond: Bool;
  word: String;
}

struct CellWrap {
  cc: Cell;
}

contract VarCombos {
  bs: BoolString;
  cw: CellWrap;

  init() {
    self.bs = BoolString{ cond: true, word: "ok" };
    self.cw = CellWrap{ cc: emptyCell() };
  }
}