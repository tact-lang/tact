struct OptNestedDefault {
    a: Int? = null;
    inner: InnerDefault? = null;
}

struct InnerDefault {
    x: Int = 7;
    y: String? = null;
}

contract OptNestedDefaultContract {
    storage: OptNestedDefault;
    init() {
        self.storage = OptNestedDefault{};
    }
}