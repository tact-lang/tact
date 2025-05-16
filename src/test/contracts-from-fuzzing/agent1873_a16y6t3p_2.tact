struct StructWithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    nested: NestedOptionalStruct?;
}

struct NestedOptionalStruct {
    val: Int;
    flag: Bool;
}

contract OptionalFieldsContract {
    data: StructWithOptionals;
    
    init() {
        self.data = StructWithOptionals{
            optInt: null,
            optBool: true,
            optString: null,
            nested: NestedOptionalStruct{
                val: 99,
                flag: false,
            },
        };
    }
}