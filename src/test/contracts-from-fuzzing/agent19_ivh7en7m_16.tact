struct Point {
    x: Int;
    y: Int;
}

contract Test {
    receive() {
        let p: Point = Point { x: 1, y: 2 };
    }
}