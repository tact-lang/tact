struct InnerDef {
    foo: Int = 7;
    bar: String = "bar";
}

struct OuterDef {
    inner: InnerDef;
    baz: Int = 42;
}

contract NestedDefaultsTest {
    state: OuterDef;

    init() {
        self.state = OuterDef{
            inner: InnerDef{},
        };
    }
}