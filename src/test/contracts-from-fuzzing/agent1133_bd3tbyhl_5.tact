struct LargeFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract ManyFields {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            a: 1,
            b: true,
            c: "Hi",
            d: null,
            e: "Test",
            f: null,
            g: 7,
            h: "Bye",
            i: false,
            j: 123
        };
    }
}