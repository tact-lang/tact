struct NullableStruct {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;
    cellVal: Cell?;
}

contract NullableStructContract {
    s: NullableStruct;

    init() {
        self.s = NullableStruct{
            intVal: null,
            boolVal: null,
            strVal: null,
            addrVal: null,
            cellVal: null,
        };
    }
}
