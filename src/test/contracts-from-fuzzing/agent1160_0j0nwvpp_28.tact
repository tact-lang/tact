struct SomeStruct {
    i: Int?;
    s: String?;
}

contract NestedDefaults {
    nested: SomeStruct?;

    init() {
        self.nested = null;
    }
}