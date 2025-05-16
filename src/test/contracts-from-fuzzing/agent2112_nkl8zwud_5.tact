struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptField {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            inner: Inner{ val: 99 }
        };
    }
}