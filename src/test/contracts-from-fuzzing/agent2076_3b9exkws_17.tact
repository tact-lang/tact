struct OptNestedDefault {
    inner: Inner? = null;
}

struct Inner {
    value: Int = 7;
}

contract TestContract {
    data: OptNestedDefault;

    init() {
        self.data = OptNestedDefault{};
    }
}