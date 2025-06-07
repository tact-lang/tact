struct NestedStruct {
    flag: Bool;
    text: String;
}

contract StructFieldTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            flag: true,
            text: "hello"
        };
    }
}