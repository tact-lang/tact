struct F {
    a: Bool?;
    b: Bool;
    c: Int?;
    d: Int;
    e: String?;
    f: String;
}

contract OptionalMix {
    state: F;

    init() {
        self.state = F{
            a: true,
            b: false,
            c: null,
            d: 42,
            e: null,
            f: "yo"
        };
    }
}