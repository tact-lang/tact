struct NestedStructOptional {
    sub: Int?;
}

struct HasNestedOptional {
    nested: NestedStructOptional;
    flag: Bool;
}

contract NestedOptionalField {
    data: HasNestedOptional;
    init() {
        self.data = HasNestedOptional{
            nested: NestedStructOptional{ sub: null },
            flag: true,
        };
    }
}