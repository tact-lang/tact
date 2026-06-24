struct NestedDefaults {
    ival: Int = 10;
    bval: Bool?;
}

struct Container {
    nested: NestedDefaults;
    flag: Bool;
}

contract NestedDefaultsTest {
    storage: Container;

    init() {
        self.storage = Container{
            nested: NestedDefaults{bval:null},
            flag: true,
        };
    }
}