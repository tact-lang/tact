struct NestedX {
    a: Int; b: Int?; c: Int; d: Int?;
}

contract OptionalMix {
    x: NestedX?;

    init() {
        self.x = null;
    }
}