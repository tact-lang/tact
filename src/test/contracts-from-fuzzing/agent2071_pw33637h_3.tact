struct LongStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int;
    f: Bool;
    g: String;
    h: Int;
    i: Bool;
    j: String;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct {
            a: 1,
            b: 2,
            c: true,
            d: "abc",
            e: 3,
            f: false,
            g: "def",
            h: 4,
            i: true,
            j: "ghi",
        };
    }
}