struct HasNestedOptional {
    nested: Int?;
    anInt: Int;
}

contract OptionalWithDefault {
    data: HasNestedOptional = HasNestedOptional{
        nested: null,
        anInt: 5
    };

    init() {
        self.data = HasNestedOptional{
            nested: 42,
            anInt: 20
        };
    }
}
