struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    c: Int;
    d: Inner;
}

struct Outer {
    e: Int;
    f: Mid;
}

contract DeepNestedWithPrimitives {
    foo: Outer;
    init() {
        self.foo = Outer{ e: 1, f: Mid{ c: 2, d: Inner{ a:3, b:true } } };
    }
}