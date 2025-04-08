struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalsTest {
    stuff: Opts;

    init() {
        self.stuff = Opts{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null
        };
    }
}
