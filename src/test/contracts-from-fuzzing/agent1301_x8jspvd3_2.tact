struct DeepNested {
    foo: Int;
    nested: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    d: DeepNested;
    
    init() {
        self.d = DeepNested{ foo: 1, nested: Inner{ a: 2, b: false } };
    }
}