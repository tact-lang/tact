struct OptionalCellHolder {
  maybeCell: Cell?;
}

contract OptionalCellTest {
  val: OptionalCellHolder;

  init() {
    self.val = OptionalCellHolder{ maybeCell: null };
  }
}