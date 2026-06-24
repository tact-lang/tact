message MyMessage {
    a: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // This should match messages of type MyMessage as per docs 
    }
}
