struct SOpt {
    optfield: Int?;
}

contract NestedOptionalStruct {
    nested: SOpt?;

    init() {
        self.nested = SOpt{optfield: null};
    }
}