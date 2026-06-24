struct Coordinates {
    x: Int;
    y: Int;
}

struct Metadata {
    name: String;
    creator: Address;
    description: String?;
}

contract ComplexState {
    coords: Coordinates;
    info: Metadata;

    init() {
        self.coords = Coordinates{ x: 1, y: 2 };
        self.info = Metadata{ name: "meta", creator: myAddress(), description: null };
    }
}
