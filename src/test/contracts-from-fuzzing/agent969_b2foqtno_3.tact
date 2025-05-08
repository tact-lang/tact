struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptContract {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
            f: "test"
        };
    }
}
