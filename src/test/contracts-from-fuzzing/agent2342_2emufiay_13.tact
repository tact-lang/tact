struct DeepOptOptional {
    foo: Int?;
    bar: String?;
}

struct HasDeepOpt {
    deep: DeepOptOptional?;
}

contract NestedOptionalStruct {
    field: HasDeepOpt;

    init() {
        self.field = HasDeepOpt{
            deep: DeepOptOptional{
                foo: 123,
                bar: null
            }
        };
    }
}