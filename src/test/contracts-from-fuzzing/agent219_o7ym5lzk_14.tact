struct SubNested {
    val: Int;
    flag: Bool;
}

contract OptionalNestedField {
    nested: SubNested?;

    init() {
        self.nested = SubNested{
            val: 55,
            flag: true
        };
    }
}