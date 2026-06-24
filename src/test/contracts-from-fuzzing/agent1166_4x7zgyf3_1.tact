contract SingleComplexField {
    coord: Coord;

    init() {
        self.coord = Coord{
            x: 1,
            y: 2,
            label: "origin",
            nested: Nested{
                flag: true,
                count: 42,
                optVal: null
            },
            optZ: null
        };
    }
}

struct Coord {
    x: Int;
    y: Int;
    label: String;
    nested: Nested;
    optZ: Int?;
}

struct Nested {
    flag: Bool;
    count: Int;
    optVal: String?;
}
