struct MixedDeep {
    a: Int;
    b: Mid?;
}

struct Mid {
    x: Int;
    y: Leaf?;
}

struct Leaf {
    z: Bool;
}

contract DeepOptTest {
    field: MixedDeep = MixedDeep{ a: 1, b: null };

    init() {
        self.field = MixedDeep{
            a: 3,
            b: Mid{ x: 5, y: Leaf{ z: true } }
        };
    }
}