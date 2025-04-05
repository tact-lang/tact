message M {
    x: Int;
    y: Bool;
}

contract Test {
    receive(msg: M) {
        let a = msg.x;
        let b = msg.y;
    }
}