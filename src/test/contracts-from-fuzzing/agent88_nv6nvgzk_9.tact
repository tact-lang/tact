struct NestedWithDefaults {
    n: Int = 7;
    s: String = "default";
    b: Bool?;
}

struct Container {
    nested: NestedWithDefaults;
    name: String;
    flag: Bool = false;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container {
            nested: NestedWithDefaults {
                b: null
            },
            name: "test"
        };
    }
}