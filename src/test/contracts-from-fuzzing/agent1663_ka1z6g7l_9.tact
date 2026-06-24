struct OptionalStringStruct {
    os1: String?;
    os2: String?;
}

contract OptStrings {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            os1: null,
            os2: "hello",
        };
    }
}