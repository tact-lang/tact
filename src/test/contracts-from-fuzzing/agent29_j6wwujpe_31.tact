struct NestedDefaults {
    inner: InnerDefault;
}

struct InnerDefault {
    foo: Int = 7;
    bar: Bool = false;
}

contract NestedDefaultsContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerDefault{}
        };
    }
}