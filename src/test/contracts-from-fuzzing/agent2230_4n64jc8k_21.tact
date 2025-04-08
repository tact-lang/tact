struct BoolOptional {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract OptionalBools {
    flags: BoolOptional;
    init() {
        self.flags = BoolOptional{ a: true, b: null, c: false };
    }
}