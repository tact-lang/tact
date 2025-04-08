struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: String;
    l: Bool;
    m: Int;
    n: Bool;
    o: String;
}

contract ManyFields {
    bf: BigFields;
    
    init() {
        self.bf = BigFields{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: "e",
            f: false,
            g: 7,
            h: true,
            i: "i",
            j: null,
            k: "k",
            l: false,
            m: 13,
            n: true,
            o: "o",
        };
    }
}