struct Coordinates {
    x: Int as int64;
    y: Int as int64;
    label: String;
}

contract StructInPersistentState {
    pos: Coordinates;

    init() {
        self.pos = Coordinates{
            x: 100,
            y: 200,
            label: "origin",
        };
    }
}