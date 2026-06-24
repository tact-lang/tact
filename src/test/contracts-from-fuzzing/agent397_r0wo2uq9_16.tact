struct NestedDefault {
    f1: Int? = null;
    f2: Inner;
}

struct Inner {
    inside: Int = 0;
}

contract WithDefaults {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{
            f1: null,
            f2: Inner{ inside: 5 }
        };
    }
}