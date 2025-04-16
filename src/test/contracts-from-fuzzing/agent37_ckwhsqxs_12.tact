message MyMsg {
    a: Int;
}

contract TestUnderscoreMsg {
    // Receiver with discarded message parameter using underscore for a typed message
    receive(_: MyMsg) {
        // no action
    }
}
