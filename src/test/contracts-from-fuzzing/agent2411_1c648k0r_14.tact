struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalNestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null
        };
    }
}