struct Inner {
    y: Int;
}

struct Outer {
    x: Inner?;
}

contract OptNestedStruct {
    foo: Outer;

    init() {
        self.foo = Outer{ x: null };
    }
}
