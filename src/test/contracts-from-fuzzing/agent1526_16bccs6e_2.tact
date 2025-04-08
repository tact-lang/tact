struct MultiOptional {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    strVal: String?;
}

contract OptionalFieldsTest {
    mo: MultiOptional;

    init() {
        self.mo = MultiOptional{
            intVal: null,
            boolVal: null,
            addrVal: null,
            strVal: null,
        };
    }
}