struct NestedStruct {
    innerBool: Bool;
    innerInt: Int;
    innerOptString: String?;
}

contract DeepNestedContract {
    nestedField: NestedStruct;
    topBool: Bool;
    topInt: Int;

    init() {
        self.nestedField = NestedStruct{
            innerBool: true,
            innerInt: 123,
            innerOptString: "hello",
        };
        self.topBool = false;
        self.topInt = 456;
    }
}