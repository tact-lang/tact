struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalFieldsMix {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: 7,
            b: null,
            c: null,
            d: null
        };
    }
}