struct OptionalPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;
    addressVal: Address?;
}

contract OptionalPrimStruct {
    s: OptionalPrimitives;

    init() {
        self.s = OptionalPrimitives{
            intVal: null,
            boolVal: null,
            stringVal: null,
            sliceVal: null,
            cellVal: null,
            addressVal: null,
        };
    }
}