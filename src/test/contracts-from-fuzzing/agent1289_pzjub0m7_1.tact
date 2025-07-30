struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeepNestedTest {
    outerField: InnerStruct;

    init() {
        self.outerField = InnerStruct{
            a: 5,
            b: true,
        };
    }
}
