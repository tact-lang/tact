struct SOptional {
    x: Int?;
    y: Bool;
}

contract StructOptionalMix {
    s: SOptional;

    init() {
        self.s = SOptional {
            x: null,
            y: false
        };
    }
}