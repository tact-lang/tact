struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct ContainsNestedOptional {
    baz: NestedOptional?;
    other: Bool;
}

contract OptionalStructField {
    val: ContainsNestedOptional;

    init() {
        self.val = ContainsNestedOptional{
            baz: null,
            other: true
        };
    }
}