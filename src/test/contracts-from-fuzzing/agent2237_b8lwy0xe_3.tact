struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
    h: Bool;
    i: Int;
}

contract OptionalVariations {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: null,
            h: false,
            i: 100
        };
    }
}