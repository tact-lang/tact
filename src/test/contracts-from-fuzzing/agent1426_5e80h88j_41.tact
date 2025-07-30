// Struct with optional nested struct fields, some missing
struct Coord {
    x: Int;
    y: Int;
}

struct MaybeCoord {
    point: Coord?;
    label: String?;
}

contract NestedMaybe {
    coord: MaybeCoord;

    init() {
        self.coord = MaybeCoord{
            point: null,
            label: "center"
        };
    }
}