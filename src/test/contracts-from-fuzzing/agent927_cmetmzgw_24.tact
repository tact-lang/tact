// optional outer + default nested opt
struct NestedNullDefaults {
    n: N? = null;
}

struct N {
    v: Int = 1;
}

contract DefaultOpt {}

contract UsesDefaults {
    data: NestedNullDefaults;

    init() {
        self.data = NestedNullDefaults{};
    }
}