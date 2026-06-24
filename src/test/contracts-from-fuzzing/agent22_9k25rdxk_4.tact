message SomeMessage {
    a: Int;
}

contract TestMultipleBounced {
    bounced(msg: bounced<SomeMessage>) {
        // first bounce receiver
    }
    
    bounced(raw: Slice) {
        // second bounce receiver
    }

    receive("dummy") {}
}
