struct Agg {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract OptFieldContract {
    agg: Agg;

    init() {
        self.agg = Agg{
            a: null,
            b: true,
            c: null,
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
        };
    }
}