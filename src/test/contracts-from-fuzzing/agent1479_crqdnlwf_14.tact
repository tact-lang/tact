struct MixedOpt {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Int?;
    f: Bool;
}

contract Test {
    stuff: MixedOpt;
    init() {
        self.stuff = MixedOpt{
            a: 5,
            b: null,
            c: "abc",
            d: null,
            e: 100,
            f: true
        };
    }
}