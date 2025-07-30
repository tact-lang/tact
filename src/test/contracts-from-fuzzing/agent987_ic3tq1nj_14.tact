struct Inner {
    val: Int;
}

struct Outer {
    a: Inner?;
    b: Inner?;
}

contract NestedOptionalStructs {
    foo: Outer?;

    init() {
        self.foo = Outer{ a: null, b: null };
    }
}