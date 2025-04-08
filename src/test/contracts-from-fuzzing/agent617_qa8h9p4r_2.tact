struct Complex {
    sub1: Coord;
    sub2: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{
            sub1: Coord{ x: 1, y: 2 },
            sub2: Coord{ x: 3, y: 4 }
        };
    }
}