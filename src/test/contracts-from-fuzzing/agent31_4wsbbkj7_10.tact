message A {
    x: Int;
}

message B {
    y: Int;
}

contract Test {
    receive(msg: A) {
        let v = msg.x;
    }

    receive(msg: B) {
        let v = msg.y;
    }
}