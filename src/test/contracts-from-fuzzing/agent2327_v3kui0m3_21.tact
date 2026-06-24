struct SStrange {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Int?;
    f: String;
}

contract WeirdCombos {
    s: SStrange;

    init() {
        self.s = SStrange{
            a: 1,
            b: true,
            c: null,
            d: myAddress(),
            e: null,
            f: "abc"
        };
    }
}
