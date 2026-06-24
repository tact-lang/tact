struct MixedOptionals {
    a: Int?;
    b: Bool;
    c: Address?;
    d: Bool?;
    e: Int;
}

contract Test {
    mixed: MixedOptionals;

    init() {
        self.mixed = MixedOptionals{
            a: null,
            b: false,
            c: null,
            d: null,
            e: 42,
        };
    }
}