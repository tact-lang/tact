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
    j: Int;
    k: Bool;
    l: String;
}

contract LargeFields {
    st: LargeStruct;

    init() {
        self.st = LargeStruct{
            a: 1,
            b: false,
            c: "c",
            d: null,
            e: true,
            f: null,
            g: 7,
            h: true,
            i: "i",
            j: 10,
            k: false,
            l: "l"
        };
    }
}
