struct Coord {
    x: Int;
    y: Int;
}

struct BoundingBox {
    topLeft: Coord;
    bottomRight: Coord;
}

struct Scene {
    bounds: BoundingBox;
    id: Int;
}

contract TestContract {
    scene: Scene;

    init() {
        self.scene = Scene{
            bounds: BoundingBox{
                topLeft: Coord{ x: -10, y: -10 },
                bottomRight: Coord{ x: 10, y: 10 },
            },
            id: 42,
        };
    }
}