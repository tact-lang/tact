struct DeepOptional {
    level1: Int?;
    level2: String?;
    level3: Bool?;
}

struct ParentWithDeepOptional {
    nested: DeepOptional;
    other: Bool;
}

contract DeepOptionalContract {
    data: ParentWithDeepOptional;

    init() {
        self.data = ParentWithDeepOptional{
            nested: DeepOptional{
                level1: null,
                level2: null,
                level3: true
            },
            other: false
        };
    }
}