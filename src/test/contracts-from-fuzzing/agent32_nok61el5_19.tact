message MyMessage {
    value: Int?;
}

contract TestContract {
    receive(msg: Slice) {
        // Do something
    }
}