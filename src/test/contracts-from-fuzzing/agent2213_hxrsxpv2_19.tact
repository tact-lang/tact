struct OneType {
    a: Int;
}

struct MixedNest {
    x: OneType;
    y: Bool;
    z: String;
}

contract WithMixedNest {
    nested: MixedNest;

    init() {
        self.nested = MixedNest{
            x: OneType{ a: 55 },
            y: true,
            z: "x",
        };
    }
}
