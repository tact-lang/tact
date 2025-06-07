struct OptionalStruct {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;
}

contract OptionalsTest {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            intVal: null,
            boolVal: null,
            strVal: null,
            addrVal: null
        };
    }
}
