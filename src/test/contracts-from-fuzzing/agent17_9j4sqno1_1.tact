struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestFuzz {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: 2,
            f: false,
            g: "bye",
            h: myAddress(),
        };
    }
}