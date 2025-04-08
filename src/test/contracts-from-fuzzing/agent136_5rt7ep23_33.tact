struct OptNested {
    nested: Int?;
}

contract NullableInStruct {
    f: OptNested;

    init() {
        self.f = OptNested{ nested: null };
    }
}