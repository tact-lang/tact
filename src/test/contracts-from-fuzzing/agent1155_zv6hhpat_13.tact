struct OptionalPrimitives {
    intField: Int?;
    boolField: Bool?;
    addrField: Address?;
    cellField: Cell?;
    sliceField: Slice?;
    builderField: Builder?;
    stringField: String?;
}

struct OptionalStruct {
    nested: OptionalPrimitives?;
}

contract TestContract {
    optstr: OptionalStruct;

    init() {
        self.optstr = OptionalStruct{
            nested: OptionalPrimitives{
                intField: 5, boolField: false, addrField: null,
                cellField: null, sliceField: null, builderField: null, stringField: "y"
            }
        };
    }
}