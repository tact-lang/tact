struct OptPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    addrVal: Address?;
}

contract OptPrimitivesTest {
    data: OptPrimitives;

    init() {
        self.data = OptPrimitives{
            intVal: null,
            boolVal: null,
            strVal: null,
            cellVal: null,
            sliceVal: null,
            addrVal: null,
        };
    }
}