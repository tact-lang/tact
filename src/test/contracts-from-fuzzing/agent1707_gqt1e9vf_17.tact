struct OptionalSliceStruct {
    body: Slice?;
    text: String;
}

contract OptSliceInStruct {
    field: OptionalSliceStruct;

    init() {
        self.field = OptionalSliceStruct{
            body: null,
            text: "hello"
        };
    }
}