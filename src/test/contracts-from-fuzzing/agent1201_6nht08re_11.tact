struct InnerWithDefaults {
    foo: Int = 7;
    bar: Bool? = null;
}

struct Middle {
    inner: InnerWithDefaults;
}

contract NestedDefaultsTest {
    data: Middle;

    init() {
        self.data = Middle{
            inner: InnerWithDefaults{}
        };
    }
}