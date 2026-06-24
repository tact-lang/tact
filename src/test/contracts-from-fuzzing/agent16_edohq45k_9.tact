message MyMsg {
    value: Int;
}

contract Test {
    receive(_: MyMsg) {
        // Using underscore to discard message parameter.
        let x = 1;
    }
}
