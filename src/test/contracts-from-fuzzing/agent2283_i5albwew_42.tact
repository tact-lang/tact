struct NestedNullableDefaults {
    a: Int? = null;
}

struct Middle {
    inner: NestedNullableDefaults = NestedNullableDefaults{};
}

contract NullableNestedDefaults {
    all: Middle = Middle{};

    init() {
        self.all = Middle{};
    }
}
