struct NestedStruct {
    value: Int;
}

contract OptNested {
    ns: NestedStruct?;

    init() {
        self.ns = null;
    }
}