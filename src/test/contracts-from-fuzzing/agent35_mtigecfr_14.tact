message MyTyped {
    a: Int;
}

contract Test {
    // Testing underscore usage in typed binary receiver for message MyTyped
    receive(_: MyTyped) {
        let dummy = 1;
    }
}
