struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    nested: Inner;
    val: Int;
}

contract TestContract {
    foo: Outer;
    init() {
        self.foo = Outer{ nested: Inner{}, val: 9 };
    }
}