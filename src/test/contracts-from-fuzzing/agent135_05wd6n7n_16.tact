struct LotsOfOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Builder?;
}

contract MixOptionals {
    data: LotsOfOptionals;

    init() {
        self.data = LotsOfOptionals{
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
