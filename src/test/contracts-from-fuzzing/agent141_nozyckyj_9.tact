message UnderMsg {
    value: Int;
}

contract UnderScoreBinaryReceiver {
    // Receiver for typed binary message using underscore for unused parameter
    receive(_: UnderMsg) {
        // No operation
    }
}
