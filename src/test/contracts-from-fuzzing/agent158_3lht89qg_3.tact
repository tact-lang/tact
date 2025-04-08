struct ManyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract WideOptionals {
    value: ManyOpt;
    init() {
        self.value = ManyOpt{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}