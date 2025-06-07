struct Coord {
    x: Int;
    y: Int;
}

struct BoundingBox {
    topLeft: Coord;
    bottomRight: Coord;
}

contract TestContract {
    bbox: BoundingBox;

    init() {
        self.bbox = BoundingBox{
            topLeft: Coord{ x: 0, y: 0 },
            bottomRight: Coord{ x: 100, y: 100 },
        };
    }
}