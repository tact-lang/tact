struct OptNested {
    x: Int?;
    y: Int?;
}

struct OptLevel {
    a: OptNested?;
    b: Bool?;
}

contract OptionalChains {
    chain1: OptLevel;

    init() {
        self.chain1 = OptLevel{a: null, b: true};
    }
}