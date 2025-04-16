struct Coord {
    x: Int;
    y: Int;
}

struct BoundingBox {
    topLeft: Coord?;
    bottomRight: Coord?;
}

struct Scene {
    bounds: BoundingBox?;
    id: Int;
}

contract TestContract {
    sceneMaybe: Scene?;

    init() {
        self.sceneMaybe = Scene{
            bounds: BoundingBox{
                topLeft: Coord{ x: 1, y: 2 },
                bottomRight: null,
            },
            id: 777,
        };
    }
}