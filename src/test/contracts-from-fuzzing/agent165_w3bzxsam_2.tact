struct Coord { x: Int; y: Int }

struct Box { origin: Coord; end: Coord }

contract Test {
    box: Box;

    init() {
        self.box = Box{
            origin: Coord{ x: 1, y: 2 },
            end: Coord{ x: 3, y: 4 }
        };
    }
}