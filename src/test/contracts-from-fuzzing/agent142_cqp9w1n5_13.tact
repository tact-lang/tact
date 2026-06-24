message MyMSG {
    value: Int;
}

contract Test {
    // Using underscore to discard the parameter in a typed binary message receiver
    receive(_: MyMSG) {
        // intentionally left empty
    }
}
