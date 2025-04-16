struct InnerDefault {
    x: Int = 1;
    y: Bool = false;
}

struct Outer {
    inner: InnerDefault;
    z: String = "hi";
}

contract NestedDefaults {
    data: Outer;
    init() {
        self.data = Outer{
            inner: InnerDefault{},
        };
    }
}