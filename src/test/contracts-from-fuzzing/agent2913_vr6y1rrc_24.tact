struct NestedNullDefaults {
    x: Int? = null;
}

struct Top {
    n: NestedNullDefaults? = null;
}

contract NestedWithDefaults {
    f: Top;

    init() {
        self.f = Top{};
    }
}