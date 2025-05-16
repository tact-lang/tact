struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
}

contract MultipleOptionalFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}