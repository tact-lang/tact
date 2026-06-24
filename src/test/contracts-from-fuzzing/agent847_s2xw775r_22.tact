struct Longevity {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
}

contract LongStructOptionalMix {
    field: Longevity;

    init() {
        self.field = Longevity{
            a: null,
            b: null,
            c: null,
            d: null,
            e: 1,
            f: true,
            g: "x",
            h: myAddress()
        };
    }
}