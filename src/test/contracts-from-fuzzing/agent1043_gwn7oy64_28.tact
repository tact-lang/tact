struct Compose {
    n1: NestedDefaults;
    n2: NestedDefaults;
}

struct NestedDefaults {
    x: Int = -1;
    y: Bool = true;
}

contract TestContract {
    data: Compose;

    init() {
        self.data = Compose{
            n1: NestedDefaults{},
            n2: NestedDefaults{}
        };
    }
}