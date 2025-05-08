struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract AssignNestedField {
    nested: Outer;

    init() {
        self.nested = Outer{inner: Inner{a: 42}};
    }
}
