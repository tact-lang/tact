struct Coord {
    x: Int;
    y: Int;
}

struct OptionalNested {
    coord: Coord?;
    label: String;
}

contract OptionalDeep {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            coord: null,
            label: "label"
        };
    }
}