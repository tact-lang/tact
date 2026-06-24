message MyMsg {
    data: Int
}

contract Test {
    // Receiver for typed binary message (using a message type definition)
    receive(msg: MyMsg) {
        // Handling a binary message of type MyMsg
    }
    
    // Dummy getter to ensure the contract is compiled
    get fun dummy(): Int {
        return 5;
    }
}
