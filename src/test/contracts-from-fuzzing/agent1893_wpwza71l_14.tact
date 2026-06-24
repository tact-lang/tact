struct NullableNested {
    v: Int?;
}

contract OptionalFieldTest {
    nested: NullableNested;
    flag: Bool;

    init() {
        self.nested = NullableNested{ v: null };
        self.flag = true;
    }
}