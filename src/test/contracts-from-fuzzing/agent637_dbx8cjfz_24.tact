// optional nested Cell fields
struct CellNest {
  child: ChildCell?;
}

struct ChildCell {
  x: Cell?;
}

contract TestContract {
  nn: CellNest;

  init() {
    self.nn = CellNest{
      child: ChildCell{ x: null }
    };
  }
}