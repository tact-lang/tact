struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract TestNestedGetter {
    s: Outer = Outer {
        inner: Inner { a: 10, b: false },
        x: 100
    };
    
    get fun getNested(): Outer {
        return self.s;
    }
    
    receive() {}
}
