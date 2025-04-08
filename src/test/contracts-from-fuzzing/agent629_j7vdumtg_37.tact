struct DeepNestedOpt {
    inner: MiddleOpt;
}

struct MiddleOpt {
    foo: InnerMostOpt;
}

struct InnerMostOpt {
    opt: Int?;
}

contract NestedOptLevels {
    val: DeepNestedOpt;

    init() {
        self.val = DeepNestedOpt{
            inner: MiddleOpt{
                foo: InnerMostOpt{
                    opt: null
                }
            }
        };
    }
}