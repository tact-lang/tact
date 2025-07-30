struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
}

contract ManyFields {
    data: S1;

    init() {
        self.data = S1{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: null,
            f: null,
            g: 7,
            h: "h",
            i: false
        };
    }
}