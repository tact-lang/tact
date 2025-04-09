message MyMessage {
    data: Cell;
}

contract TestContract {
    receive(msg: MyMessage) {
    }
}