message Msg1 {
    a: Int;
}

message Msg2 {
    m1: Msg1;
    b: Int;
}

contract Test {
    receive(msg: Msg2) {
        let x = msg.m1.a + msg.b;
    }
}