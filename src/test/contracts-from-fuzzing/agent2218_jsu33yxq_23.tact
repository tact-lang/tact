struct NestedDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 5;
    y: Bool = true;
}

contract Test {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{
            inner: Inner{}
        };
    }
}