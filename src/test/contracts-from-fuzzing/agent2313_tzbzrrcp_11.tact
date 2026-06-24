struct NestedWithDefaultsOptional {
    foo: Inner? = null;
}

struct Inner {
    bar: Int = 1;
    baz: Bool = true;
}

contract TestContract {
    data: NestedWithDefaultsOptional;

    init() {
        self.data = NestedWithDefaultsOptional{};
    }
}