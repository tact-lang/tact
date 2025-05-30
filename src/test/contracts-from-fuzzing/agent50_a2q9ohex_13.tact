struct NestedDefault {
    x: Int = 1;
    y: Inner;
}

struct Inner {
    z: Int = 2;
    t: Bool = false;
}

contract NestedDefaultsTest {
    storage: NestedDefault;

    init() {
        self.storage = NestedDefault{
            y: Inner{}
        };
    }
}