message MyMessage {
    value: Int;
}

fun createMessage(val: Int): MyMessage {
    return MyMessage{value: val};
}

contract TestContract {
    fun processMessage(msg: MyMessage) {
        let x = msg.value;
    }

    receive(msg: MyMessage) {
        self.processMessage(msg);
    }
}