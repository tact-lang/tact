struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint64;
    e: Bool;
    f: String;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Int as coins;
}

contract ContractLargeStruct {
    data: LargeStruct;

    init() {
        self.data = LargeStruct {
            a: 1,
            b: true,
            c: "hi",
            d: 42,
            e: false,
            f: "bye",
            g: null,
            h: null,
            i: null,
            j: ton("2")
        };
    }
}
