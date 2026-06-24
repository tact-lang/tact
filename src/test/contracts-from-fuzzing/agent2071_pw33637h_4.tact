struct NestedOptionals {
    option1: Inner?;
}

struct Inner {
    value: Int?;
    flag: Bool?;
}

contract TestNestedOption {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals {
            option1: null,
        };
    }
}