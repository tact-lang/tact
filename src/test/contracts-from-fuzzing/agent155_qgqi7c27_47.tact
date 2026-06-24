contract BigOptionalStruct {
    big: BigOpt;
    init() {
        self.big = BigOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}

struct BigOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: String?;
    f: Cell?;
}
