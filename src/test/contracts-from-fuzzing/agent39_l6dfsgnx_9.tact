struct Point {
    x: Int;
    y: Int;
}

message Shape {
    point: Point;
}

contract Test {
    receive(message: Shape) {
        // use message.point.x
    }
}