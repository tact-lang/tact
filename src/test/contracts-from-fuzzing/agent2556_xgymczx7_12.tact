struct NestedOptionalsDefaults {
    a: Int? = null;
    b: InnerOptDefault? = null;
}

struct InnerOptDefault {
    c: Int? = null;
    d: InnerMost? = null;
}

struct InnerMost {
    e: Int? = null;
}

contract LayeredDefaultOptional {
    data: NestedOptionalsDefaults;

    init() {
        self.data = NestedOptionalsDefaults{};
    }
}
