struct ManyStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestManyStrings {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            a: "alpha",
            b: null,
            c: "gamma",
            d: "delta"
        };
    }
}
