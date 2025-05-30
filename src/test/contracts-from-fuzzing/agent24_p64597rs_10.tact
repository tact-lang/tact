struct Point {
    x: Int;
    y: Int;
}

message Msg {
    p: Point;
}

contract Test {
    receive(msg: Msg) {
        let sum = msg.p.x + msg.p.y;
    }
}