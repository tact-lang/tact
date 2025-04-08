struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalSoup {
    slots: OptionalMix;

    init() {
        self.slots = OptionalMix{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}