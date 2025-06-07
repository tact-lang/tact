message MyMsg {
    x: Int;
}

contract Test {
    // Testing underscore usage in typed binary message receiver
    receive(_: MyMsg) {
        return;
    }
}
