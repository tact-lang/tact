struct NestedOptDefaults {
    opt: Inner? = null;
}

struct Inner {
    x: Int;
}

contract TestContract {
    data: NestedOptDefaults;

    init() {
        self.data = NestedOptDefaults{};
    }
}