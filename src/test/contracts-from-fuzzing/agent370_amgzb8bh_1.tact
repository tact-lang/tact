struct BigStruct {
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
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Int;
    t: Bool;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "A",
            d: null,
            e: null,
            f: null,
            g: 2,
            h: false,
            i: "B",
            j: null,
            k: null,
            l: null,
            m: 3,
            n: true,
            o: "C",
            p: null,
            q: null,
            r: null,
            s: 4,
            t: false
        };
    }
}