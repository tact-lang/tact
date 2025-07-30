message MyMessage {
    value: Int;
}

contract TestMyMsgReceiver {
    // Test typed binary message receiver using a message type
    receive(msg: MyMessage) {
        // Accessing field from MyMessage
        let x = msg.value;
    }
    
    fun dummy() : Int {
        return 4;
    }
}
