struct OptionalNest {
    label: String?;
    data: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptTest {
    store: OptionalNest;

    init() {
        self.store = OptionalNest { label: null, data: null };
    }
}