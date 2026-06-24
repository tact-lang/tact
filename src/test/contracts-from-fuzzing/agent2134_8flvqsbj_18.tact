struct NestedDefaultInner {
    z: Int = 777;
}

struct NestedDefaults {
    a: Int = 1;
    inner: NestedDefaultInner = NestedDefaultInner{};
}

contract NestedDefaultsContract{
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}