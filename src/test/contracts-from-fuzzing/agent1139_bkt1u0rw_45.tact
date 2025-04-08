struct SInner {
    x: Int?;
}

contract StructFieldDefaultOpt {
    foo: SInner;
    bar: Int;
    
    init() {
        self.foo = SInner{ x: null };
        self.bar = 13;
    }
}