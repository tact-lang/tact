struct NestedOptDefaults {
    s: Inner?;
}

struct Inner {
    f: Int? = null;
}

contract TestContract {
    nested: NestedOptDefaults;
    init() {
        self.nested = NestedOptDefaults{s: null};
    }
}