struct NestedBoolOpt {
    flag: Bool?;
    deep: InnerDeep;
}

struct InnerDeep {
    innerFlag: Bool?;
    num: Int;
}

contract TestContract {
    data: NestedBoolOpt;

    init() {
        self.data = NestedBoolOpt{
            flag: true,
            deep: InnerDeep{
                innerFlag: false,
                num: 42,
            }
        };
    }
}