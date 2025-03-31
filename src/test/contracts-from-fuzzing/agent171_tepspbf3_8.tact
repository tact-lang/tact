message MyMsg {}

contract Test {
    // Receiver for typed binary messages: should only match messages of type MyMsg
    receive(msg: MyMsg) {
    }
}
