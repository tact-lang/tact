struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct Container {
    x: NestedDefaults;
    y: Int = 5;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            x: NestedDefaults{},
            y: 10
        };
    }
}