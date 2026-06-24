struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

struct Scene {
    r1: Rectangle;
    r2: Rectangle;
}

contract ComplexGeometry {
    scene: Scene;

    init() {
        self.scene = Scene{
            r1: Rectangle{
                topLeft: Point{ x: 0, y: 0 },
                bottomRight: Point{ x: 10, y: 10 }
            },
            r2: Rectangle{
                topLeft: Point{ x: 20, y: 20 },
                bottomRight: Point{ x: 30, y: 30 }
            }
        };
    }
}