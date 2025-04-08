struct DeepOpt {
    value: Int;
}

struct MiddleOpt {
    deep: DeepOpt?;
}

struct TopStruct {
    middle: MiddleOpt?;
}

contract TestContract {
    field: TopStruct;

    init() {
        self.field = TopStruct{
            middle: MiddleOpt{
                deep: DeepOpt{
                    value: 123,
                },
            },
        };
    }
}