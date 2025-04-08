struct Coord { x: Int; y: Int }

contract TestContract {
    point: Coord;

    init() {
        self.point = Coord{ x: 1, y: 2 };
    }
}