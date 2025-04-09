struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
}

contract TestContract {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            a: null,
            b: true,
            c: myAddress(),
            d: emptyCell().asSlice(),
            e: null
        };
    }
}