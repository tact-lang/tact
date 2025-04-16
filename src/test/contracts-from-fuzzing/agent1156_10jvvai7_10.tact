struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
}

contract StructOfStructs {
    nested: NestedWithOptionals;

    init() {
        self.nested = NestedWithOptionals{ a: null, b: null };
    }
}