struct OptionalLayer1 {
    x: Int?;
}

struct OptionalLayer2 {
    y: OptionalLayer1?;
}

contract NestedOptionalLayers {
    s: OptionalLayer2;

    init() {
        self.s = OptionalLayer2{ y: null };
    }
}
