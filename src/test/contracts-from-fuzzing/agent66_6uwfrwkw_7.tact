struct OptionalNested {
    opt: Int?;
    deep: DeepOpt?;
}

struct DeepOpt {
    val: Int?;
    val2: Int?;
}

contract OptStructDeepOpt {
    value: OptionalNested;

    init() {
        self.value = OptionalNested{
            opt: null,
            deep: null
        };
    }
}