struct NestedAB {
    a: Int;
    b: Bool;
}

contract OptionalNestedAB {
    nestedOpt: NestedAB?;

    init() {
        self.nestedOpt = null;
    }
}