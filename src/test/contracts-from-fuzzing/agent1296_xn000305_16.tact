struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct Wrap {
    inner: NestedDefaults = NestedDefaults{};
}

contract TestContract {
    val: Wrap;
    init() {
        self.val = Wrap{};
    }
}