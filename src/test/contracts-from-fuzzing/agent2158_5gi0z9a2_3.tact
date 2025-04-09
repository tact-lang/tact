struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract DeepNestedTest {
    field: DeepNested;
    
    init() {
        self.field = DeepNested{
            inner: InnerStruct{ flag: false, number: 123 }
        };
    }
}