struct NestedDefaults {
    nested1: InnerDefaults;
    nested2: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 42;
    y: Bool = false;
}

contract NestedDefaultContract {
    defaults: NestedDefaults;

    init() {
        self.defaults = NestedDefaults{
            nested1: InnerDefaults{},
            nested2: InnerDefaults{ y: true }
        };
    }
}