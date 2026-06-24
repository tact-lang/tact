struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct Container {
    nested: NestedDefaults;
}

contract DefaultsInNested2 {
    state: Container;

    init() {
        self.state = Container{
            nested: NestedDefaults{},
        };
    }
}
