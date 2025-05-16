struct BigOptions {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
}

contract OptionHeavy {
    data: BigOptions;

    init() {
        self.data = BigOptions{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: "x"
        };
    }
}