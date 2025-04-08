struct OptInner {
    val: Int;
}

struct Container {
    innerOpt: OptInner?;
}

contract NestedOptionalField {
    s: Container;
    init() {
        self.s = Container{ innerOpt: null };
    }
}