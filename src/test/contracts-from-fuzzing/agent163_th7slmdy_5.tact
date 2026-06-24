struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    s1: Inner;
    s2: Inner;
}

contract NestedStructs {
    storage: Outer;
    
    init() {
        self.storage = Outer{
            s1: Inner{ foo: 1, bar: true },
            s2: Inner{ foo: 2, bar: null },
        };
    }
}