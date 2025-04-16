struct ManyOpts {
    s: String?;
    sl: Slice?;
    b: Bool?;
}

contract MulOptionalField {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            s: null,
            sl: null,
            b: null
        };
    }
}