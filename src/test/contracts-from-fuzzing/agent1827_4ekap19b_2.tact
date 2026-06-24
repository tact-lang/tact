struct NestedInStruct {
    a: Int;
    b: Int?;
}

contract StructInStorage {
    nested: NestedInStruct;

    init() {
        self.nested = NestedInStruct{ a: 1, b: null };
    }
}