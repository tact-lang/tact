struct Small {
    a: Int;
}

struct Medium {
    b: Small;
    c: Small;
}

struct Large {
    d: Medium;
    e: Medium;
    f: String?;
    g: Bool;
    h: Int?;
}

contract MultiLayer {
    stored: Large;

    init() {
        self.stored = Large{
            d: Medium{b: Small{a:1}, c: Small{a:2}},
            e: Medium{b: Small{a:3}, c: Small{a:4}},
            f: "hi",
            g: false,
            h: null
        };
    }
}