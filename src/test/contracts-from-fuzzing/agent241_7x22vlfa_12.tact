struct NestedDefaults {
    s: String = "default";
}

struct Container {
    nested: NestedDefaults;
}

contract NestedDefaultsContract {
    val: Container;

    init() {
        self.val = Container{
            nested: NestedDefaults{}
        };
    }
}