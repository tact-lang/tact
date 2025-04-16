struct Complex {
    level1: Bool;
    level2: String;
    level3: Int as uint64;
    level4: Int?;
}

contract NestedAndSerialize {
    f: Complex;

    init() {
        self.f = Complex{
            level1: true,
            level2: "abc",
            level3: 15,
            level4: null
        };
    }
}