message MyMsg2 {
    value: Int;
}

contract TestUnderscore {
    // Receiver function using underscore to discard the parameter
    receive(_: MyMsg2) {
        // Nothing is done with the parameter
    }
}
