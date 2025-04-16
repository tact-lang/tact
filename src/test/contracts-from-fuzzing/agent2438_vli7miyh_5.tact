struct Inner {
    flag: Bool;
}

struct Outer {
    nestedOpt: Inner?;
}

contract OptionalNested {
    foo: Outer?;

    init() {
        self.foo = null;
    }
}
