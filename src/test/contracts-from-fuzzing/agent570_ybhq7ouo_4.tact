struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
    j: Int;
    k: Bool?;
    l: String;
    m: Int?;
    n: Bool;
    o: String;
}

contract LargeStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: null,
            f: "y",
            g: 2,
            h: false,
            i: null,
            j: 3,
            k: null,
            l: "z",
            m: null,
            n: true,
            o: "w"
        };
    }

    receive() {}
}