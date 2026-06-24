struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract TestOptNested {
    data: OptionalNestedStruct;
    
    init() {
        self.data = OptionalNestedStruct{
            inner: null,
        };
    }
}
