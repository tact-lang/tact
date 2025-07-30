struct OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
    addressOpt: Address?;
}

contract Test {
    data: OptionalPrimitiveFields;

    init() {
        self.data = OptionalPrimitiveFields{
            intOpt: null,
            boolOpt: null,
            cellOpt: null,
            sliceOpt: null,
            stringOpt: null,
            addressOpt: null,
        };
    }
}