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
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: false,
            f: "hi",
            g: 42,
            h: false,
            i: "end",
            j: 999,
        };
    }
}
