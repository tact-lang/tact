struct NestedStruct {
    bar: Bool;
    baz: Int?;
}

contract StructInStorage {
    s: NestedStruct = NestedStruct{ bar: true, baz: null };

    init() {
        self.s = NestedStruct{ bar: false, baz: 123 };
    }
}