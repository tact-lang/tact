message MyMessage {
    value: Int;
}

contract TestContract {
    receive() {
        let x = 1;
    }

    receive(msg: MyMessage) {
        let y = msg.value;
    }
}