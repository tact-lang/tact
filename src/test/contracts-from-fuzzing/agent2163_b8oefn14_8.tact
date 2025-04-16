struct OptionalDeepNest {
    inner: Int?;
    innerStr: String?;
}

struct OptionalMidNest {
    deep: OptionalDeepNest?;
}

contract OptionalNesting {
    field: OptionalMidNest;

    init() {
        self.field = OptionalMidNest{
            deep: null
        };
    }
}