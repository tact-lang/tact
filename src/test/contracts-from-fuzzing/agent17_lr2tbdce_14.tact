message MyMessage {
    value: Int;
}

contract TestUnderscoreTyped {
    // Receiver for typed binary message using a message type, ignoring the parameter
    receive(_: MyMessage) {
        // handler for typed message with ignored parameter
    }

    // Getter to ensure compilation
    get fun test(): Int {
        return 0;
    }
}
