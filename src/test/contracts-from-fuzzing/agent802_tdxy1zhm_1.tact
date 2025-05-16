struct InnerStruct {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optIntField: Int?;
}

contract DeepNestedTest {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{
            intField: 42,
            boolField: true,
            stringField: "hello",
            optIntField: null,
        };
    }
}