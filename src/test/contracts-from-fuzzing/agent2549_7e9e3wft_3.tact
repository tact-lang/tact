struct LongerFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool;
    g: Int;
    h: String?;
}

contract TestLongFields {
    myData: LongerFields;

    init() {
        self.myData = LongerFields{
            a: 1,
            b: true,
            c: "A",
            d: null,
            e: "E",
            f: false,
            g: 100,
            h: "H",
        };
    }
}