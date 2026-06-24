message A {
    x: Int;
}

message B {
    y: A;
}

contract Test {
    receive(msg: B) {
        let z = msg.y.x;
    }
}