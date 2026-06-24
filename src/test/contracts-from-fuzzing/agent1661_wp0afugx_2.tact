struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    innerStr: String;
}

contract NestedTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerInt: 10,
            innerBool: false,
            innerStr: "nested"
        };
    }
}