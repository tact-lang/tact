struct TypeA {
    x: Int;
}

message TypeB {
    y: Int;
}

contract TestContract {
    receive(msg: TypeB) {
        let y = msg.y;
    }
}