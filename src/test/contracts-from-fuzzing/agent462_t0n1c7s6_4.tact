struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int?;
    n: String?;
    o: Bool?;
    p: Address?;
}

contract LargeFieldsContract {
    big: Large;

    init() {
        self.big = Large{
            a: 1,
            b: false,
            c: "c",
            d: myAddress(),
            e: 2,
            f: true,
            g: "g",
            h: myAddress(),
            i: 3,
            j: false,
            k: "k",
            l: myAddress(),
            m: null,
            n: null,
            o: null,
            p: null
        };
    }
}