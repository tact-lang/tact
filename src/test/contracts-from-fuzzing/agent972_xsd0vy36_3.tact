struct LongStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int;
    g: String;
    h: Int?;
    i: Bool;
    j: String;
    k: Bool?;
    l: Int;
    m: String;
    n: Int?;
    o: Bool;
}

contract TestLongStruct {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: 3,
            d: false,
            e: "str",
            f: 6,
            g: "more",
            h: 9,
            i: false,
            j: "test",
            k: true,
            l: 12,
            m: "end",
            n: 15,
            o: true,
        };
    }
}
