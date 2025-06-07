struct HugeStruct {
    a: Int;
    b: String;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
    i: Bool?;
    j: Int;
    k: String;
    l: Bool;
    m: String?;
    n: Int?;
    o: Bool;
    p: String;
    q: Int;
    r: Bool?;
}

contract LargeStructContract {
    big: HugeStruct;

    init() {
        self.big = HugeStruct{
            a: 1,
            b: "b",
            c: true,
            d: 2,
            e: null,
            f: false,
            g: 7,
            h: "h",
            i: null,
            j: 10,
            k: "k",
            l: true,
            m: "m",
            n: null,
            o: false,
            p: "p",
            q: 17,
            r: true,
        };
    }
}