struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyFields {
    data: BigFields;

    init() {
        self.data = BigFields{
            a: 1,
            b: false,
            c: "abc",
            d: null,
            e: "def",
            f: true,
            g: 7,
            h: "ghi",
            i: false,
            j: 42,
        };
    }
}