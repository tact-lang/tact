struct OptionalPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    addr: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    builderVal: Builder?;
    strVal: String?;
}

contract OptionalFieldsTest {
    data: OptionalPrimitives;
    init() {
        self.data = OptionalPrimitives{
            intVal: null,
            boolVal: null,
            addr: null,
            cellVal: null,
            sliceVal: null,
            builderVal: null,
            strVal: null
        };
    }
}