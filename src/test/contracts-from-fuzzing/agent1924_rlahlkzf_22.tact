struct OptionalPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
}

contract TestContract {
    content: OptionalPrimitives;

    init() {
        self.content = OptionalPrimitives{
            intVal: null,
            boolVal: true,
            strVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null
        };
    }
}