message SomeMessage {
    x: Int;
}

contract TestBounce1 {
    // Valid bounced receiver using a typed message
    bounced(msg: bounced<SomeMessage>) {
        // no operation
    }

    // Dummy receive function to make contract non-empty
    receive("dummy") {}
}
