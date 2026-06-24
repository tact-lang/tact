struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: String?;
}

contract TestMixedOptionals {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
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