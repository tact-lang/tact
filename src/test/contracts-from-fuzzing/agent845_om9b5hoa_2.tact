struct DeeplyNestedOptional {
    val: Int?;
}

struct NestedStructWithOptional {
    nested: DeeplyNestedOptional?;
    flag: Bool;
}

contract OptionalNestedFieldsTest {
    data: NestedStructWithOptional;

    init() {
        self.data = NestedStructWithOptional{
            nested: null,
            flag: true
        };
    }
}