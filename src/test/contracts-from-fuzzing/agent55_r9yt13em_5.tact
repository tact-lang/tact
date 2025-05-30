message MyMsg {
    x: Int;
}

contract Test {
    receive(msg: MyMsg) {
        // Process typed binary message
        let a = msg.x;
    }
}
