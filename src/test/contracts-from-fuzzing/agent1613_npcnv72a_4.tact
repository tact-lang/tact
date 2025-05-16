struct BigNested {
    a: Bool;
    b: String;
    c: Inner1;
    d: Inner2;
    e: Bool?;
    f: String?;
}

struct Inner1 {
    g: Int;
    h: Int?;
    i: String;
}

struct Inner2 {
    j: Bool;
    k: String;
    l: Deeper;
}

struct Deeper {
    m: Bool?;
    n: Int;
}

contract BigStructStore {
    field: BigNested;

    init() {
        self.field = BigNested{
            a: true,
            b: "hi",
            c: Inner1{
                g: 1,
                h: null,
                i: "bye",
            },
            d: Inner2{
                j: false,
                k: "no",
                l: Deeper{
                    m: true,
                    n: 5,
                },
            },
            e: null,
            f: "yo",
        };
    }
}
