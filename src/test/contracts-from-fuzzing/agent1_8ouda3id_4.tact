struct Point {
    x: Int;
    y: Int;
}

contract Test2 {
    p: Point = Point{ x: 10, y: 20 };

    receive() {}

    get fun getPoint(): Point {
        return self.p;
    }
}
