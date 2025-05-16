struct Point { x: Int; y: Int }
contract PointDefault {
    p: Point;
    init() {
        self.p = Point{x:0,y:0};
    }
}