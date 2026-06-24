struct S {
    x: Int;
}

contract NestedOptionalStruct {
    nested: S?;

    init() {
        self.nested = null;
    }
}