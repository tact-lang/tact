struct NestedDefaults {
    inner: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "zz";
}

contract TestContract {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: InnerDefaults{},
        };
    }
}