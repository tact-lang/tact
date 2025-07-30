struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    optionalInner: Int?;
}

contract DeepNestTest {
    outerStruct: NestedStruct;

    init() {
        self.outerStruct = NestedStruct{
            innerInt: 1,
            innerBool: true,
            optionalInner: null,
        };
    }
}