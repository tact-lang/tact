struct NestedWithDefaults {
    x: Int = 5;
    y: Bool = false;
}

struct Container {
    sub: NestedWithDefaults;
    z: Int;
}

contract NestedDefaultsContract {
    data: Container;

    init() {
        self.data = Container{ sub: NestedWithDefaults{}, z: 42 };
    }
}