struct MixNestedOptional {
    nested: Nested?;
    val: Int?;
}

struct Nested {
    flag: Bool;
    txt: String?;
}

contract MixNestingOptionals {
    data: MixNestedOptional;

    init() {
        self.data = MixNestedOptional{
            nested: Nested{
                flag: true,
                txt: null
            },
            val: 1
        };
    }
}