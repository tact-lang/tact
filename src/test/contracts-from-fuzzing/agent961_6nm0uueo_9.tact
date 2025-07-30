struct NestedOptional {
    innerOpt: Int?;
    boolVal: Bool;
}

struct Wrapper {
    optNested: NestedOptional?;
}

contract NestedOptionalsContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            optNested: null
        };
    }
}