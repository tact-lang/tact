struct NestedOptDefaults {
    inner: InnerOptDefaults;
}

struct InnerOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    s: NestedOptDefaults;

    init() {
        self.s = NestedOptDefaults{
            inner: InnerOptDefaults{}
        };
    }
}