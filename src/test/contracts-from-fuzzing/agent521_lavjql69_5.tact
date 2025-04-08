struct AllOptionals {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;
    addressVal: Address?;
}

contract OptionalFieldsContract {
    data: AllOptionals;

    init() {
        self.data = AllOptionals{
            intVal: null,
            boolVal: null,
            stringVal: null,
            sliceVal: null,
            cellVal: null,
            addressVal: null,
        };
    }
}