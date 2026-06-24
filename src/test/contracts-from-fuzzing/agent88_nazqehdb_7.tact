message MyMsg {
    a: Int;
}

contract Test {
    // Test 4 revised: Receiver for typed binary messages using message declaration
    receive(msg: MyMsg) {
        // Handling binary message of type MyMsg
    }
}