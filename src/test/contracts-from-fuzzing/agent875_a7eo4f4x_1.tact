struct OptionalFields {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
}

contract OptFieldTest {
    optStruct: OptionalFields;

    init() {
        self.optStruct = OptionalFields{
            intVal: null,
            boolVal: true,
            stringVal: "hello",
        };
    }
}