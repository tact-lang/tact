struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool;
    g: String;
    h: Bool;
    i: Int;
    j: String;
    k: Bool;
    l: Int;
}

contract Test {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: "test",
            e: 5,
            f: false,
            g: "more",
            h: true,
            i: 9,
            j: "end",
            k: false,
            l: 12,
        };
    }
}
