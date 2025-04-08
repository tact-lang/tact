struct Complex {
    a: Int;
    b: Bool;
}

contract InitNestedOptionals {
    nested: Complex?;
    nested2: Complex?;
    
    init() {
        self.nested = Complex{ a: 10, b: true };
        self.nested2 = null;
    }
}