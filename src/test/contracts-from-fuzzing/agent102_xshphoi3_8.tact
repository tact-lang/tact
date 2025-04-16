message MyMsg {
    a: Int;
}

contract Test7 {
    receive(_: MyMsg) {
        // Typed binary receiver with underscore parameter discarding the incoming message value
    }
}
