struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract WideFields {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: false,
            f: null,
            g: 7,
            h: true,
            i: "world",
            j: null,
        };
    }
}