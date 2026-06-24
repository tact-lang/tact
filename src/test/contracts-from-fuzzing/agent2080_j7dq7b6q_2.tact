struct Inner {
    foo: Int;
    bar: Bool;
    nested: String?;
}

contract TestContract {
    s: Inner;
    
    init() {
        self.s = Inner{
            foo: 1,
            bar: true,
            nested: "abc",
        };
    }
}