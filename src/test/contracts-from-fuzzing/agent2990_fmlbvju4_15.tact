struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}