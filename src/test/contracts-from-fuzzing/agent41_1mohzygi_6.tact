message MyMessage {
    value: Int;
}

contract TypedReceiver {
    // Test for typed binary message receiver
    receive(msg: MyMessage) {
        // Use message field
        let x = msg.value;
    }

    // Dummy getter for compilation
    get fun dummy(): Int {
        return 0;
    }
}
