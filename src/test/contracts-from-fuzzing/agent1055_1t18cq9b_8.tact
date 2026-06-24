struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: Address;
    i: Int;
    j: String;
    k: Bool;
    l: Int;
    m: Address;
    n: String;
}

contract EmbeddedLargeStruct {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: 2,
            e: "cat",
            f: false,
            g: 3,
            h: myAddress(),
            i: 4,
            j: "dog",
            k: true,
            l: 5,
            m: myAddress(),
            n: "fox",
        };
    }
}