struct Point2D {
    x: Int;
    y: Int;
}

struct Point3D {
    xy: Point2D;
    z: Int;
}

contract PointTest {
    p: Point3D;
    init() {
        self.p = Point3D { xy: Point2D { x:1, y:2 }, z:3 };
    }
}