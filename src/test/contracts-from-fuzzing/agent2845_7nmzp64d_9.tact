struct NestedWithDefaults {
    foo: Int = 10;
    bar: Bool?;
}

struct Container {
    inner: NestedWithDefaults;
    count: Int = 100;
}

contract NestedDefaultsTest {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedWithDefaults{
                bar: null
            }
        };
    }
}