message MyMsg {
    a: Int;
}

contract TestUnderscore {
    // Using underscore to discard the parameter value
    receive(_: MyMsg) {
        // no operation
    }
}
