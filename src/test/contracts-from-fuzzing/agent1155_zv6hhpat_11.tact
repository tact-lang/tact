struct OptionalPrimitives {
    intField: Int?;
    boolField: Bool?;
    addrField: Address?;
    cellField: Cell?;
    sliceField: Slice?;
    builderField: Builder?;
    stringField: String?;
}

contract TestContract {
    optprim: OptionalPrimitives;

    init() {
        self.optprim = OptionalPrimitives{
            intField: null, boolField: true, addrField: null,
            cellField: null, sliceField: null, builderField: null, stringField: null
        };
    }
}