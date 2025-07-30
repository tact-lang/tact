struct NestedDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 5;
    flag: Bool = true;
}

contract NestedDefaultsContract {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{inner: Inner{}};
    }
}