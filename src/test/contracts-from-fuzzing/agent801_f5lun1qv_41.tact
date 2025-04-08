struct DeeplyNestedOptional {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    maybeVal: Int?;
    maybeBool: Bool?;
}

contract DeepNestOptionalContract {
    nested: DeeplyNestedOptional;

    init() {
        self.nested = DeeplyNestedOptional{
            maybeInner: InnerStruct{
                maybeVal: 42,
                maybeBool: true,
            }
        };
    }
}