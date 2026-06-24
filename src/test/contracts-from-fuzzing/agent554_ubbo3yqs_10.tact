struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract OptionalMix {
    s: Mix;

    init() {
        self.s = Mix{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "str",
            f: null
        };
    }
}