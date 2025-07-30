struct OptionalComplex {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestOptional {
    opt: OptionalComplex;

    init() {
        self.opt = OptionalComplex{
            a: 1,
            b: null,
            c: "ok",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
        };
    }
}
