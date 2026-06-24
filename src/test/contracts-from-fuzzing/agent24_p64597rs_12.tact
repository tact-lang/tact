message Msg {
    data: Int?;
}

contract Test {
    receive(msg: Msg) {
        if (msg.data != null) {
            let d = msg.data;
        }
    }
}