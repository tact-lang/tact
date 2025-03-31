message MyMessage {
    value: Int;
}

message MyOtherMessage {
    value: Int;
}

contract Test {
    // Test 12: Two distinct typed binary receivers - should compile successfully
    receive(msg: MyMessage) {
        // Receiver for MyMessage
    }

    receive(msg: MyOtherMessage) {
        // Receiver for MyOtherMessage
    }
}
