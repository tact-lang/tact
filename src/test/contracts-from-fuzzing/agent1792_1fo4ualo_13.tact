struct DefaultNested {
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "default";
}

contract TestContract {
    data: DefaultNested;

    init() {
        self.data = DefaultNested{
            inner: InnerWithDefaults{}
        };
    }
}