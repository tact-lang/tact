struct Data {
    a: Int;
}

message Wrapper {
    d: Data;
}

contract Test {
    receive(msg: Wrapper) {
        let a = msg.d.a;
    }
}