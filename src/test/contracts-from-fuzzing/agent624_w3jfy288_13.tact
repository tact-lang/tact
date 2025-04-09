struct OptionalPack {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: Address?;
}

contract PartialOptionalAssign {
    data: OptionalPack;

    init() {
        self.data = OptionalPack{
            a: 5,
            b: null,
            c: myAddress(),
            d: null,
            e: 42,
            f: true,
            g: null,
        };
    }
}