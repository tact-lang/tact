message MyMsg {
    value: Int;
}

contract TestUnderscoreTyped {
    // Receiver for typed binary message MyMsg using underscore to discard parameter
    receive(_: MyMsg) {
        // No operation
    }
}
