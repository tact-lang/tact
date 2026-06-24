struct OptionalBools {
    a: Bool?;
    b: Bool?;
}

contract OptBool {
    s: OptionalBools;
    init() {
        self.s = OptionalBools{ a: null, b: null };
    }
}