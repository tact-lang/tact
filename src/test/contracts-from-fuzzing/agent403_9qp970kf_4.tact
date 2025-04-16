struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    s1: LargeNested;
    s2: LargeNested;

    init() {
        self.s1 = LargeNested{
            a: 1,
            b: true,
            c: "s1",
            d: myAddress(),
            e: null,
            f: false,
            g: null,
            h: null,
        };

        self.s2 = LargeNested{
            a: 2,
            b: false,
            c: "s2",
            d: myAddress(),
            e: 5,
            f: null,
            g: "opt",
            h: myAddress(),
        };
    }
}
