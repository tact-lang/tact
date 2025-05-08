message MyMsg {
    val: Int;
}

contract UnderscoreReceiver {
    // Test F: Using underscore to discard the parameter in a typed binary receiver
    receive(_: MyMsg) {
        // Parameter discarded, simply a placeholder
    }
    
    // A dummy receive for contract initialization
    receive() {}
}
