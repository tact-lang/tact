message HasCell { data: Cell }

contract Test {
  receive(m: HasCell) {}
}