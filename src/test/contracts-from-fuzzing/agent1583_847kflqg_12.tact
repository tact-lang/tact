struct Mixed {
    a: Int;
    b: String?;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
}

contract Mix {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 5,
            b: null,
            c: true,
            d: "z",
            e: null,
            f: null,
        };
    }
}