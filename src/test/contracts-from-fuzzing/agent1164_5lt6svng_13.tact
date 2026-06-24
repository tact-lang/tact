struct NestedStrOpt {
    x: Int;
    y: String?;
}

contract NestedStructOptionals {
    s1: NestedStrOpt?;
    s2: NestedStrOpt?;

    init() {
        self.s1 = NestedStrOpt{x: 10, y: null};
        self.s2 = null;
    }
}