message MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: MyMessage) {
        let val: Int = msg.value;
    }

    receive() {
        let val: Int = 1;
    }
}