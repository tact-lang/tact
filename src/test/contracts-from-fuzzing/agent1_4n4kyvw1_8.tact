struct Point {
    x: Int;
    y: Int;
}

message Move {
    target: Point;
}

contract Test {
    receive() {
        let m = Move{target: Point{x: 10, y: 20}};
    }
}