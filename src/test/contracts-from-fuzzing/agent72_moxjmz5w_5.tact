struct Opts {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Address?;
}

contract OptionalFields {
    optData: Opts;

    init() {
        self.optData = Opts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}