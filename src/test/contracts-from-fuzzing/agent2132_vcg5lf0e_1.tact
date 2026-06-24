struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    count: Int;
}

contract DeepNested {
    nested: Outer;
    
    init() {
        self.nested = Outer {
            inner: Inner { a: 42, b: true },
            flag: false,
            count: 100
        };
    }
}