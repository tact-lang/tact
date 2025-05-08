struct SOpt {
    inner: Int?;
}

contract StructWithOptionalStruct {
    nested: SOpt?;

    init() {
        self.nested = null;
    }
}