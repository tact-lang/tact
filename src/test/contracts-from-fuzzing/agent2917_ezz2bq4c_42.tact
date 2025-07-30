struct OptionalDeepMix {
    a: Int?;
    b: Mid?;
}

struct Mid {
    x: Int?;
    y: Leaf?;
}

struct Leaf {
    z: Int?;
}

contract OptionalMixDepth {
    combined: OptionalDeepMix;

    init() {
        self.combined = OptionalDeepMix{a: null, b: null};
    }
}
