struct NestedOptional {
    val: Int?;
    flag: Bool;
}

contract StructOptionalField {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            val: null,
            flag: true
        };
    }
}