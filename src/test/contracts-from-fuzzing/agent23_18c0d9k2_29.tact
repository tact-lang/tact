struct SOpt {
    num: Int? = null;
}

contract NestedOptionalDefault {
    nested: SOpt? = null;

    init() {
        self.nested = null;
    }
}