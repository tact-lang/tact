struct NestedDefaultOpt {
    inner: Inner?;
}

struct Inner {
    foo: Int = 42;
    bar: Bool = true;
}

contract StorageTest {
    data: NestedDefaultOpt;

    init() {
        self.data = NestedDefaultOpt{};
    }
}