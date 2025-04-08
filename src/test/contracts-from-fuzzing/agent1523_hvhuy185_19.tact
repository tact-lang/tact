struct Point3D {
    x: Int;
    y: Int;
    z: Int;
}

contract Geometry {
    p1: Point3D;
    opt_p2: Point3D?;
    text: String;

    init() {
        self.p1 = Point3D{ x:1, y:2, z:3 };
        self.opt_p2 = null;
        self.text = "coords";
    }
}