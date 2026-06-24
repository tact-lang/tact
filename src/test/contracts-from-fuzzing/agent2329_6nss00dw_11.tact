struct SDeep {
    s: String;
    inner: Int?;
}

struct SOuter {
    a: Int;
    nested: SDeep;
}

contract OptionalDeep {
    fo: SOuter?;

    init() {
        self.fo = SOuter{
            a: 42,
            nested: SDeep{
                s: "test",
                inner: null
            }
        };
    }
}
