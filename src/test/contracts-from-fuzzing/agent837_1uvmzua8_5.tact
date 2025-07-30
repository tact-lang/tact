struct VeryWide {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
    f: String;
    g: Int?;
    h: Bool;
    i: String;
    j: Int;
}

contract ManyFields {
    data: VeryWide;
    init() {
        self.data = VeryWide{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: 5,
            f: "hi",
            g: 42,
            h: false,
            i: "bye",
            j: 99,
        };
    }
}