struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptDefaults {
    data: Opts;

    init() {
        self.data = Opts{
            a: null,
            b: null,
            c:"hi",
            d: myAddress(),
            e: emptyCell()
        };
    }
}