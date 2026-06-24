struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PersistentNestedOptionals {
    nested: NestedOptionalStruct;

    init() {
        self.nested = NestedOptionalStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}