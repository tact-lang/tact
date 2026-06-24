message MyMessage {
    value: Int = 0;
}

contract TestContract {
    receive() {
        let msg = MyMessage{};
    }
}