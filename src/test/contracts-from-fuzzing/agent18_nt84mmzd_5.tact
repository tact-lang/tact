message MyMsg {
    a: Int;
}

contract Test {
    receive(msg: MyMsg) {
        let b = msg.a;
    }
}