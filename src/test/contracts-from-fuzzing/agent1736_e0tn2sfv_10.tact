struct Coords {
    x: Int;
    y: Int;
}

struct Meta {
    desc: String;
    active: Bool;
}

struct Package {
    coords: Coords;
    meta: Meta;
}

contract NestedCombo {
    store: Package;
    init() {
        self.store = Package{
            coords: Coords{ x: -1, y: 1 },
            meta: Meta{ desc: "combo", active: false }
        };
    }
}