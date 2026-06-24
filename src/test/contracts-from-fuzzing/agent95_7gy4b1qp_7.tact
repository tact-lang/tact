struct Inner {
    foo: Int?;
    bar: Bool;
}

struct MiddleOptional {
    inner: Inner?;
    val: Int;
}

contract NestedOptionalContract {
    data: MiddleOptional;

    init() {
        self.data = MiddleOptional{
            inner: null,
            val: 42
        };
    }
}