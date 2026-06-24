struct NestedDefaults {
    i: Int = 5;
    b: Bool = true;
}

struct Container {
    nested: NestedDefaults;
}

contract TestNestedDefaults {
    data: Container;
    init() {
        self.data = Container{
            nested: NestedDefaults{}
        };
    }
}