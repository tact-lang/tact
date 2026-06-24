struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Address?;
}

contract OptionalEverything {
    s: HasOptionals;

    init() {
        self.s = HasOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}