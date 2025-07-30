struct NestedOptional {
    nested: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ nested: Inner{ val: 42 } };
    }
}