struct Inner {
    z: Int;
}

message Outer {
    in1: Inner;
    in2: Inner;
}

contract Test {
    receive(msg: Outer) {
        let a = msg.in1.z + msg.in2.z;
    }
}