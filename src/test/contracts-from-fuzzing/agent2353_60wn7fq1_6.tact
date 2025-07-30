struct LongStruct {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
    e: String?;
    f: Bool?;
    g: Int;
    h: Bool;
    i: String;
    j: Bool;
}

contract HoldsLongStruct {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            a: 1,
            b: "hi",
            c: null,
            d: true,
            e: null,
            f: null,
            g: 2,
            h: false,
            i: "bye",
            j: true
        };
    }
}