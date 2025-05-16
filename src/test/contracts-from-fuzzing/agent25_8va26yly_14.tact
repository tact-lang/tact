struct Inner {
    z: Int;
}

message Msg {
    s: Inner;
}

contract Test {
    receive(msg: Msg) {
        let v = msg.s.z;
    }
}