struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: String?;
    j: Bool?;
    k: String;
    l: Int?;
    m: String;
    n: Bool?;
    o: Int?;
}

contract BigStructContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "e",
            f: null,
            g: 7,
            h: false,
            i: null,
            j: null,
            k: "k",
            l: null,
            m: "m",
            n: null,
            o: 42,
        };
    }
}
