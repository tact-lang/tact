struct LargeStruct {
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

contract LargeFields {
    bigData: LargeStruct;

    init() {
        self.bigData = LargeStruct{
            a: 1,
            b: false,
            c: "one",
            d: null,
            e: null,
            f: null,
            g: 2,
            h: true,
            i: "two",
            j: null,
            k: null,
            l: null,
        };
    }
}