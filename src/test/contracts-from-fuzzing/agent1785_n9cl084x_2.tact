struct Coord {
    x: Int;
    y: Int;
}

struct Wrapper {
    coord: Coord;
    optionalInt: Int?;
    flag: Bool;
}

contract ComplexStorage {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            coord: Coord{ x: 10, y: 20 },
            optionalInt: null,
            flag: true,
        };
    }
}