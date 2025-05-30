// Snippet 5: Bounce receiver with underscore parameter

message MyMessage {
    data: Int as uint64;
}

contract BounceTestUnderscore {
    bounced(_: bounced<MyMessage>) {
        // Simply discard the bounced message
    }
}
