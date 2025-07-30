struct NestedOptionalStruct {
    nested: Int?;
}

contract StructWithOptionalStructOptional {
    f: NestedOptionalStruct?;

    init() {
        self.f = null;
    }
}