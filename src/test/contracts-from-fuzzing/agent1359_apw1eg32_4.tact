struct ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract ComplexOptionalsContract {
    opt: ComplexOptionals;

    init() {
        self.opt = ComplexOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}