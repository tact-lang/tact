struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract TestBigStruct {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "abc",
            f: null,
            g: myAddress(),
            h: null
        };
    }
}
