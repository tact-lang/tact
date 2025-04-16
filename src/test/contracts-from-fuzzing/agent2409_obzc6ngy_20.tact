struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptionalField {
    f: NestedOptional;

    init() {
        self.f = NestedOptional{
            inner: null
        };
    }
}