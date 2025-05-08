struct MiddleCells {
  c1: Cell;
  c2: Cell;
  c3: Cell;
}

contract Test44 {
  mid: MiddleCells;

  init() {
    self.mid = MiddleCells{
      c1:emptyCell(), c2:emptyCell(), c3:emptyCell()
    };
  }
}