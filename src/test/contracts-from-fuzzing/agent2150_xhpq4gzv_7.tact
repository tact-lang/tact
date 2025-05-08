struct OptionalStruct {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    builderVal: Builder?;
}

contract TestContract {
    d: OptionalStruct;

    init() {
        self.d = OptionalStruct{
            intVal: null,
            boolVal: null,
            stringVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null,
            builderVal: null
        };
    }
}