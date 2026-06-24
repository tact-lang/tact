struct Point {
    x: Int;
    y: Int;
}

message Move {
    position: Point;
}

contract Test {
    receive(msg: Move) {
        let pos = msg.position;
    }
}