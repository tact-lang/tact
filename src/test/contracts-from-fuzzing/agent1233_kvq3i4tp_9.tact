struct InnerMost {
    a: Int;
}

struct Inner {
    s: InnerMost?;
}

struct Outer {
    t: Inner?;
}

contract NestedOptionalStructsTest {
    field: Outer;

    init() {
        self.field = Outer{ t: null };
    }
}