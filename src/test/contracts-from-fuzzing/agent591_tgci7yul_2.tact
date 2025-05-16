struct Inner {
    foo: Int;
    bar: Bool;
    opt: Int?;
}

contract OptionalNested {
    nested: Inner;
    
    init() {
        self.nested = Inner{ foo: 7, bar: true, opt: null };
    }
}