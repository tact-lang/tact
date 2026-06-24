struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract LargeFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: "c",
            d: 4,
            e: false,
            f: "f",
            g: 7,
            h: true,
            i: "i",
            j: 10,
        };
    }
}