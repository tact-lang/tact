struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

contract TestNestedOptionals {
    nested: Inner?;
    
    init() {
        self.nested = null;
    }
}