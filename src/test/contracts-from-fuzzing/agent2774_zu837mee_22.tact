// optional Cell persistent field assigned emptyCell()
contract TestContract {
  ref: Cell?;

  init() {
    self.ref = emptyCell();
  }
}