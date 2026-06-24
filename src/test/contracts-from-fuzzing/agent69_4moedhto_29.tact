struct DeepDefaultsOverride {
    inner: NestedInner;
}

struct NestedInner {
    a: Int = 7;
    b: String = "default";
}

contract DeepDefaultsOverrideTest {
    data: DeepDefaultsOverride;
    init() {
        self.data = DeepDefaultsOverride{
            inner: NestedInner{
                a: 100,
                b: "changed"
            }
        };
    }
}