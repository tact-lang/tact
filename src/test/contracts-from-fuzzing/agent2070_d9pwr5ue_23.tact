struct NestedDefaults {
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    foo: Int = 5;
    bar: Bool = false;
}

contract DefaultInNested {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerWithDefaults{}
        };
    }
}