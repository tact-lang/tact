struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: String;
    h: Bool;
    i: Int?;
    j: String;
}

contract Storage {
    ls: LargeStruct;

    init() {
        self.ls = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: null,
            f: null,
            g: "g",
            h: false,
            i: null,
            j: "j",
        };
    }
}