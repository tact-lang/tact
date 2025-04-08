struct NestedDefaults {
    s: Inner;
}

struct Inner {
    x: Int = 123;
}

contract NestedDefaultsContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{ s: Inner{} };
    }
}