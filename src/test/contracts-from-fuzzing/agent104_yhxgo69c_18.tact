struct NestedNullable {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    storage: NestedNullable;
    init() {
        self.storage = NestedNullable{ inner: null };
    }
}