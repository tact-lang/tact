struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    a: Int;
}

contract OptionalNestedStruct {
    s: OptionalNested;
    
    init() {
        self.s = OptionalNested{ inner: null };
    }
}