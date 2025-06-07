struct LongFlat {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Int;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    l: Int;
}

contract ManyFieldsContract {
    field: LongFlat;

    init() {
        self.field = LongFlat{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: "hi",
            f: 3,
            g: true,
            h: "there",
            i: 4,
            j: false,
            k: "!",
            l: 5,
        };
    }
}
