struct MultiOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: Bool?;
}

contract LotsOfOptionals {
    stuff: MultiOptionals;

    init() {
        self.stuff = MultiOptionals{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: true,
        };
    }
}
