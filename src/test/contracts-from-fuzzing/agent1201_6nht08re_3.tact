struct ManyOptionalFields {
    intVal: Int?;
    boolVal: Bool?;
    cellVal: Cell?;
    addressVal: Address?;
    stringVal: String?;
}

contract OptionalFieldsTest {
    state: ManyOptionalFields;

    init() {
        self.state = ManyOptionalFields{
            intVal: null,
            boolVal: null,
            cellVal: null,
            addressVal: null,
            stringVal: null
        };
    }
}