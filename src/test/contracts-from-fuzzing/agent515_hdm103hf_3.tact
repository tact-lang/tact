struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
    i: Int?;
    j: Bool;
}

contract TestLarge {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: 2,
            e: null,
            f: false,
            g: 3,
            h: "h",
            i: null,
            j: true
        };
    }
}