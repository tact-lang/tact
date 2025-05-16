struct Optionals {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;
    addressVal: Address?;
}

contract TestContract {
    optionals: Optionals;

    init() {
        self.optionals = Optionals{
            intVal: 1,
            boolVal: false,
            stringVal: null,
            sliceVal: null,
            cellVal: null,
            addressVal: null
        };
    }
}