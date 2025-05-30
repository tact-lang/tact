struct NestedOptionalStruct {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

struct HasNestedOptional {
    nested: NestedOptionalStruct?;
    val: Int;
}

contract HasNestedOptionalContract {
    data: HasNestedOptional;

    init() {
        self.data = HasNestedOptional{
            nested: null,
            val: 17
        };
    }
}