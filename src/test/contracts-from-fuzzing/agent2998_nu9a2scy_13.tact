struct OptionalComplex {
    str: String?;
    cell: Cell?;
    slice: Slice?;
    addr: Address?;
}

contract ComplexOptionals {
    field: OptionalComplex;

    init() {
        self.field = OptionalComplex{
            str: null,
            cell: null,
            slice: null,
            addr: null,
        };
    }
}