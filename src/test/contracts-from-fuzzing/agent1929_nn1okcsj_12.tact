struct WithStrings {
    a: String;
    b: String;
    c: String?;
    d: String?;
}

contract TestStrings {
    s: WithStrings;
    init() {
        self.s = WithStrings{
            a: "alpha",
            b: "beta",
            c: null,
            d: "delta"
        };
    }
}