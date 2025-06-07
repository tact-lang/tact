contract NestedStructsWithSerialization {
    pos: Coordinates;
    meta: Metadata;

    init() {
        self.pos = Coordinates{
            x: 10, y: 20, label: "here"
        };
        self.meta = Metadata{
            owner: myAddress(),
            active: true
        };
    }
}

struct Coordinates {
    x: Int as int64;
    y: Int as int64;
    label: String;
}

struct Metadata {
    owner: Address;
    active: Bool;
}