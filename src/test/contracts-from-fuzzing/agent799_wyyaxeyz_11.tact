struct MixedOptional {
    a: Int?;
    b: Bool;
    c: Bool?;
    d: String;
    e: Address?;
    f: String?;
    g: Int;
}

contract OptionalShuffle {
    data: MixedOptional;
    init() {
        self.data = MixedOptional {
            a: null,
            b: true,
            c: null,
            d: "abc",
            e: null,
            f: null,
            g: 7
        };
    }
}