message MyMsg {
    x: Int;
}

contract Test {
    // Test case: Typed binary message receiver attempting field access
    receive(msg: MyMsg) {
        let a: Int = msg.x;
        a;
    }
}
