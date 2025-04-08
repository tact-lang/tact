struct OptionalStruct {
    intVal: Int?;
    boolVal: Bool?;
    addressVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    stringVal: String?;
}

contract TestContract {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{
            intVal: null,
            boolVal: null,
            addressVal: null,
            cellVal: null,
            sliceVal: null,
            stringVal: null
        };
    }
}