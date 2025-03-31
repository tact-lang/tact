message TestMsg {
    data: Int;
}

contract TestUnderscore {
    // Usage of underscore to discard the parameter
    receive(_: TestMsg) {
        // Unused parameter
    }
}
