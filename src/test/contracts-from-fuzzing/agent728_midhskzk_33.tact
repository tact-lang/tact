struct AllOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OnlyNulls {
    data: AllOpt;

    init() {
        self.data = AllOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}