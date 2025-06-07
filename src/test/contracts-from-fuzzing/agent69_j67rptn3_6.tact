message Msg { value: Int; }

contract TestReceiver {
    // Receiver function with a valid message type and return statement
    receive(msg: Msg) {
        if (msg.value == 0) {
            return;
        }
        dump(msg.value);
    }
}
