struct OptionalPrimitiveStruct {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
}

contract OptionalStructField {
    data: OptionalPrimitiveStruct;

    init() {
        self.data = OptionalPrimitiveStruct{
            intVal: null,
            boolVal: null,
            strVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null,
        };
    }
}
