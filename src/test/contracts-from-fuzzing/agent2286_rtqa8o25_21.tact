struct NestedOpt {
    a: Int?;
}

contract NestedOptionals {
    s: NestedOpt? = null;

    init() {
        self.s = NestedOpt{ a: 1 };
    }
}