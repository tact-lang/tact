struct SOpt {
    a: Int?;
}

contract NestedDoubleOptional {
    foo: SOpt? = null;

    init() {
        self.foo = SOpt{a:7};
    }
}