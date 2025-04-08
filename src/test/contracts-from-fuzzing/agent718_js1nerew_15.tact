struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    inner: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 42;
    y: Bool = true;
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerDefaults{}
        };
    }
}