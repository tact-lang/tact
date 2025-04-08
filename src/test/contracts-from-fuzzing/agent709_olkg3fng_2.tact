struct Inner {
    val: Int;
}

struct NestedOptional {
    inner: Inner;
    name: String?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: Inner{ val: 123 },
            name: "test"
        };
    }
}