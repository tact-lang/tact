message MyMessage {
    value: Int;
}

fun createMessage(val: Int): MyMessage {
    return MyMessage{value: val};
}

contract TestContract {
    receive() {
        let msg = createMessage(123);
    }
}