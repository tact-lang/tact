message MyMessage {
    value: Int;
}

// Test 9: Bounce receiver with underscore parameter name
contract BounceUnderscore {
    bounced(_msg: bounced<MyMessage>) {
        return;
    }
}
