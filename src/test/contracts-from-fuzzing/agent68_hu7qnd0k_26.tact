struct Mix {
    id: Int;
    flag: Bool = true;
    note: String?;
    nested: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract MixedDefaults {
    data: Mix;

    init() {
        self.data = Mix{
            id: 7,
            nested: Coord{ x: 1, y: 2 }
        };
    }
}
