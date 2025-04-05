message NestedMsg {
    inner: Msg;
}

message Msg {
    data: Int;
}

contract Test {
    receive(msg: NestedMsg) {
        let d = msg.inner.data;
    }
}