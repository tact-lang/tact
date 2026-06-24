struct Inner {
    p: Int;
    q: Bool;
    optStr: String?;
}

contract PersistNested {
    nested: Inner;
    
    init() {
        self.nested = Inner{ p: 10, q: true, optStr: null };
    }
}