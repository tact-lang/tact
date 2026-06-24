struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    innerString: String;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerInt: 1,
            innerBool: true,
            innerString: "hello"
        };
    }
}