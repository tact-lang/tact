struct VariantUnion {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    strVal: String?;
}

contract OptionalVariant {
    data: VariantUnion = VariantUnion{
        intVal: null,
        boolVal: null,
        addrVal: null,
        cellVal: null,
        sliceVal: null,
        strVal: null
    };

    init() {
        self.data = VariantUnion{
            intVal: 1,
            boolVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null,
            strVal: null
        };
    }
}
