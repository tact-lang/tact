struct LargeStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "1";
    d: Int = 2;
    e: Bool = true;
    f: String = "2";
    g: Int = 3;
    h: Bool = false;
    i: String = "3";
    j: Int = 4;
    k: Bool = true;
    l: String = "4";
}

contract LargeEmbedded {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 11,
            b: true,
            c: "c",
            d: 22,
            e: false,
            f: "f",
            g: 33,
            h: true,
            i: "i",
            j: 44,
            k: false,
            l: "l"
        };
    }
}