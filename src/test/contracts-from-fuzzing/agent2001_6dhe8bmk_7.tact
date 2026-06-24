struct DeeplyNestedOptional {
    s: StructInOpt?;
}

struct StructInOpt {
    x: Int;
    y: String?;
}

contract OptionalStructField {
    nested: DeeplyNestedOptional;

    init() {
        self.nested = DeeplyNestedOptional{
            s: StructInOpt{
                x: 10,
                y: null,
            }
        };
    }
}