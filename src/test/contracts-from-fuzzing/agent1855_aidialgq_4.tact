struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract TestContract {
    storage: NestedOptional;

    init() {
        self.storage = NestedOptional{
            inner: Inner{val: null},
        };
    }
}