struct LargeNested {
    a: Int;
    b: String;
    c: InnerLarge;
    d: Bool;
}

struct InnerLarge {
    x1: Int;
    x2: String;
    x3: Bool;
    x4: Int?;
    x5: String?;
    x6: Bool?;
}

contract ContractLargeNested {
    state: LargeNested;

    init() {
        self.state = LargeNested{
            a: 1,
            b: "zz",
            c: InnerLarge{
                x1: 10,
                x2: "inn",
                x3: true,
                x4: null,
                x5: null,
                x6: null
            },
            d: false,
        };
    }
}