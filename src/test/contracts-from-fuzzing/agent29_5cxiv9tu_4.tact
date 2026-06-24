struct Point {
    x: Int;
    y: Int;
}

contract Test {
    p: Point = Point { x: 1, y: 2 };

    get fun getPoint(): Point {
        return self.p;
    }

    receive() {
        self.getPoint();
    }
}
