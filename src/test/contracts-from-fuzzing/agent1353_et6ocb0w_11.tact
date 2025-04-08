struct NestedOptionals {
    a: Int?;
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract TestContract {
    foo: NestedOptionals;

    init() {
        self.foo = NestedOptionals{
            a: null,
            inner: null
        };
    }
}