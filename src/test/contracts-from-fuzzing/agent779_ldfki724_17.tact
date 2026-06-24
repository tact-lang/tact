struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract LargePersistent {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: null,
            f: null,
            g: 2,
            h: false,
            i: "b",
            j: 3,
            k: false,
            l: "c"
        };
    }
}