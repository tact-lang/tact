message MyMsg {
    intField: Int;
}

contract Test {
    receive(msg: MyMsg) {
        let x = msg.intField;
    }
}