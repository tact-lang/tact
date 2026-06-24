message CellMessage {
    data: Cell;
}

contract TestContract {
    receive(msg: CellMessage) {
    }
}