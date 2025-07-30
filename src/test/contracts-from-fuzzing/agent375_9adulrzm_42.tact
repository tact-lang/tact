// Mix nested struct optional with primitive default inside nested
struct NestedDefault {
    inner: Inner?;
    mark: Int;
}

struct Inner {
    x: Int = 42;
    y: Bool = false;
}

contract TestContract {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{
            inner: null,
            mark: 7
        };
    }
}
