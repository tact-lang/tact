struct WrapInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract StoreWrapInts {
    f: WrapInts?;
    
    init() {
        self.f = WrapInts{ a:1, b:2, c:3, d:4 };
    }
}