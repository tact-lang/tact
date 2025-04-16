struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner?;
}

contract NestedOptionals {
    data: Outer?;
    init() {
        self.data = null;
    }
}