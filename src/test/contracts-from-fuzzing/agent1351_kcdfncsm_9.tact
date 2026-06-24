struct Point2D { x: Int; y: Int }
struct Point3D { xy: Point2D; z: Int }
struct Point4D { xyz: Point3D; w: Int }

contract ComplexGeom {
    position: Point4D;

    init() {
        self.position = Point4D{
            xyz: Point3D{
                xy: Point2D{ x:1, y:2 },
                z:3
            },
            w:4
        };
    }
}