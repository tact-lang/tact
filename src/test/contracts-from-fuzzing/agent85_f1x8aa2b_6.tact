struct DeepNestedOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    flag: Bool;
}

contract DeepOptional {
    deep: DeepNestedOpt;

    init() {
        self.deep = DeepNestedOpt{
            innerOpt: InnerOpt{
                value: null,
                flag: true,
            }
        };
    }

    receive() {}
}