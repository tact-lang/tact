struct MultiOptional {
    i: Int?;
    s: String?;
    b: Bool?;
    c: Cell?;
    a: Address?;
    sl: Slice?;
}

contract OptionalStructDefaults {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            i: null,
            s: null,
            b: null,
            c: null,
            a: null,
            sl: null
        };
    }
}