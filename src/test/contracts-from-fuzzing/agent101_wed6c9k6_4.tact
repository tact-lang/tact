struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: Int?;
    j: String;
}

contract TestLarge {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: 2,
            d: "hi",
            e: false,
            f: "yo",
            g: 3,
            h: false,
            i: null,
            j: "end",
        };
    }
}