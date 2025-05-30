message MsgB {
    x: Int
}

contract TestUnderscoreTyped {
    // Using underscore to discard the typed binary message parameter
    receive(_: MsgB) {
        // Receiver body using a discarded parameter
    }
}
