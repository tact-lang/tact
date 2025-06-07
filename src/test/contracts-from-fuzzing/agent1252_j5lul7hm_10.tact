struct NestedWithDefaults {
    inner: InnerDefault;
}

struct InnerDefault {
    x: Int = 0;
    y: Bool = false;
    s: String = "hello";
}

contract DefaultNestedContract {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            inner: InnerDefault{}
        };
    }
}
