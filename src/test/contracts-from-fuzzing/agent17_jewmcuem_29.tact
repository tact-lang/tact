message WrappedCell {
    cellRef: Cell
}

contract Test {
    receive(msg: WrappedCell) {}
}