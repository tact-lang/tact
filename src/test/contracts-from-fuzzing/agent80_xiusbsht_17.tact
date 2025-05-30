message MyBounce {
    value: Int;
}

contract Test {
    // Testing a bounced message receiver with a typed message
    bounced(msg: bounced<MyBounce>) {
        // Body for bounced message receiver
    }
}
