// nested optional in struct defaulted to null explicitly
struct SOpt {
    field: Int? = null;
}

struct WrapOpt {
    inner: SOpt? = null;
}

contract NestedOptDefaults {
    d: WrapOpt? = null;
    init() {
        self.d = null;
    }
}