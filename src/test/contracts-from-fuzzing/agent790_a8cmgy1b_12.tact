struct Optionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptionalVariety {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}
