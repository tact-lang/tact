struct CellOpt {
  c: Cell?;
}

contract CellOptTest {
  data: CellOpt;

  init() {
    self.data = CellOpt{ c: null };
  }
}