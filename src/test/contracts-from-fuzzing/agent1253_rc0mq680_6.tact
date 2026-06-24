struct NestedDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 3;
    y: Bool = false;
}

contract Test {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: Inner{},
        };
    }
}
