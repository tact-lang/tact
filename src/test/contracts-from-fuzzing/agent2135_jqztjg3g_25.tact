struct Point {
    x: Int;
    y: Int;
}

contract ReassignInInit {
    data: Point;

    init() {
        self.data = Point{x:0,y:0};
        self.data = Point{x:1,y:1};
    }
}