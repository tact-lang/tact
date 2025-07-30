message MyMsg {
    value: Int;
}

contract Test {
    // Using underscore to discard parameter value in a typed message receiver
    receive(_: MyMsg) {
        // No operation needed, parameter is intentionally unused
    }
}
