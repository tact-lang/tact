struct NestedDefault {
    foo: Int = 42;
}

struct OuterWithDefault {
    inner: NestedDefault;
}

contract NestedDefaultTest {
    s: OuterWithDefault;

    init() {
        self.s = OuterWithDefault{ inner: NestedDefault{} };
    }
}