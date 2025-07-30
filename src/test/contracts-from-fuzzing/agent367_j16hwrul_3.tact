struct OptionalNestedStruct {
    nested: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestOptionalNested {
    data: OptionalNestedStruct;
    
    init() {
        self.data = OptionalNestedStruct{
            nested: null
        };
    }
}