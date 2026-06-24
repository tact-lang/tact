struct Inner {
    a: Int;
    b: Bool;
}

contract DeepNested {
    nested: Inner;
    
    init() {
        self.nested = Inner {
            a: 10,
            b: true,
        };
    }
}