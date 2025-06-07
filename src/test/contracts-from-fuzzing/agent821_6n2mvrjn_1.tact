struct NestedStruct {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract TestNested {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            inner: InnerStruct{val1: 1, val2: true, val3: "a"},
            optionalInner: null,
        };
    }
}