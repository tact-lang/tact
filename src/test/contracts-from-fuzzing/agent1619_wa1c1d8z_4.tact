struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: String?;
}

contract OptionalFields {
    optStruct: ManyOptionals;

    init() {
        self.optStruct = ManyOptionals {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}