struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct Container {
    nested: NestedDefaults;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedDefaults{}
        };
    }
}