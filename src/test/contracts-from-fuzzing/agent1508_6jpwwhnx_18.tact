struct NestedOptDefaults {
    n: Inner?;
}

struct Inner {
    x: Int = 5;
    y: Bool? = null;
}

contract TestContract {
    field: NestedOptDefaults;

    init() {
        self.field = NestedOptDefaults{
            n: null
        };
    }
}