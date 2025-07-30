struct NestedDefaultOpt {
    val: Int = 1;
    maybe: Int?;
}

struct Container {
    f1: NestedDefaultOpt;
    f2: NestedDefaultOpt;
}

contract NestedDefaults {
    store: Container;

    init() {
        self.store = Container{
            f1: NestedDefaultOpt{ maybe: null },
            f2: NestedDefaultOpt{ maybe: 42 }
        };
    }
}