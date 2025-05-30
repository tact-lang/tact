struct SOpt {
    opt: Int?;
}

contract NestedOptionalStruct {
    s: SOpt?;

    init() {
        self.s = null;
    }
}