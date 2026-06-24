struct Coordinates {
    x: Int;
    y: Int;
    z: Int;
}

struct MetaData {
    name: String;
    active: Bool;
    coords: Coordinates;
}

contract TestContract {
    meta: MetaData;

    init() {
        self.meta = MetaData{ name: "Node", active: true, coords: Coordinates{ x:1, y:2, z:3 } };
    }
}