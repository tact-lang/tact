message MsgA {
    x: Int;
}

message MsgB {
    y: MsgA;
}

contract TestContract {
    receive(msg: MsgB) {
        // do nothing
    }
}