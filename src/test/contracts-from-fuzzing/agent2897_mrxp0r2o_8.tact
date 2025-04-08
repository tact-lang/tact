struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract ContractWithLargeStruct {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: false,
            f: null,
            g: 2,
            h: false,
            i: "z"
        };
    }
}