struct Coord {
    x: Int;
    y: Int;
}

struct Params {
    id: Int;
    active: Bool;
    label: String;
    point: Coord;
    optValue: Int?;
}

contract DiverseStruct {
    data: Params = Params{
        id: 1,
        active: true,
        label: "test",
        point: Coord{ x: 10, y: 20 },
        optValue: null
    };
}