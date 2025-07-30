struct Point2D {
    x: Int as int32;
    y: Int as int32;
}

struct Point3D {
    x: Int as int32;
    y: Int as int32;
    z: Int as int32;
}

contract DiffStructs {
    p2: Point2D;
    p3: Point3D;

    init() {
        self.p2 = Point2D{x:1,y:2};
        self.p3 = Point3D{x:3,y:4,z:5};
    }
}
