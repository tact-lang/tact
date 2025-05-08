struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepNestedOptionals {
    nested: Inner?;
    
    init() {
        self.nested = null;
    }
}