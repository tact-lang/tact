struct OptionalString {
    field1: String?;
    field2: String?;
}

contract OptionalStringTest {
    myOptStr: OptionalString;

    init() {
        self.myOptStr = OptionalString{
            field1: "hello",
            field2: null,
        };
    }
}