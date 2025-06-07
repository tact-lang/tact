struct NestedStruct {
    point: Coord;
    label: String;
}

struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract CoordContract {
    loc: NestedStruct;

    init() {
        self.loc = NestedStruct{
            point: Coord{
                x: 10,
                y: 20,
            },
            label: "center",
        };
    }
}