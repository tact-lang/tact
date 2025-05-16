struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: String;
    i: Bool;
    j: Int;
}

contract LongFields {
    s: LongStruct;
    init() {
        self.s = LongStruct{
            a: 1,
            b: true,
            c: "a",
            d: 2,
            e: false,
            f: "b",
            g: null,
            h: "c",
            i: true,
            j: 3
        };
    }
}