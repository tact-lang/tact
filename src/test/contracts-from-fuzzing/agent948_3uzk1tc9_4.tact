struct OptionalStruct {
    x: Int;
    y: String;
}

contract OptionalFieldTest {
    optionalStruct: OptionalStruct?;

    init() {
        self.optionalStruct = OptionalStruct{
            x: 123,
            y: "test"
        };
    }
}