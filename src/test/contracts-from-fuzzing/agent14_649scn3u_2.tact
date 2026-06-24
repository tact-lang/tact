struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Address;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Int?;
    m: Address;
    n: Bool;
    o: String;
    p: Int;
}

contract LargeFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: "foo",
            e: myAddress(),
            f: false,
            g: "bar",
            h: myAddress(),
            i: 2,
            j: true,
            k: "baz",
            l: null,
            m: myAddress(),
            n: false,
            o: "qux",
            p: 3,
        };
    }
}