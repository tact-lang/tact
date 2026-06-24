struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    optionalInnerString: String?;
}

contract NestedTest {
    nestedField: NestedStruct;
    
    init() {
        self.nestedField = NestedStruct{
            innerInt: 42,
            innerBool: true,
            optionalInnerString: null
        };
    }
}