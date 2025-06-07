struct RichOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Int;
}

contract LotsOptionalPersisted {
    s: RichOptional;

    init() {
        self.s = RichOptional{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: null,
            f: 100
        };
    }
}