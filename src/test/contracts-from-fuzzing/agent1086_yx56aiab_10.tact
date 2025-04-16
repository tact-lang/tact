struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: null
        };
    }
}