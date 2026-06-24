struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStorage {
    nested: Inner;
    
    init() {
        self.nested = Inner{ a: 1, b: true, c: "hi" };
    }
}