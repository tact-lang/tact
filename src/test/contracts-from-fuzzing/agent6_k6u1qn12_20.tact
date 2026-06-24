message OptMessage {
    val: Int?;
}

contract Test {
    receive(msg: OptMessage) {
        let v = msg.val;
    }
}