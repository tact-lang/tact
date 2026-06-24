struct NestedDefaults {
    inner: InnerDefault;
}

struct InnerDefault {
    x: Int = 42;
    y: String = "default";
}

contract NestedDefaultsContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerDefault{}
        };
    }
}