message UniverseCalls {
    value: Int;
}

contract TestValidReceiver {
    receive(_: UniverseCalls) {
        // Valid: Using underscore to discard the parameter
    }
}
