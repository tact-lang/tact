struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Int;
    i: Bool?;
    j: Address;
    k: String?;
    l: Int;
    m: Bool;
    n: String;
    o: Address?;
    p: Int?;
    q: Bool;
    r: String?;
    s: Int;
    t: Bool?;
}

contract TestHuge {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: null,
            f: false,
            g: "g",
            h: 2,
            i: null,
            j: myAddress(),
            k: null,
            l: 3,
            m: false,
            n: "n",
            o: null,
            p: null,
            q: true,
            r: "hello",
            s: 4,
            t: null,
        };
    }
}