struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestMix {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
        };
    }
}