struct InnerMost {
    val: Int;
    flag: Bool?;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct MiddleOpt {
    innerOpt: InnerOpt?;
}

contract TestContract {
    data: MiddleOpt;
    init() {
        self.data = MiddleOpt{
            innerOpt: InnerOpt{
                inner: InnerMost{ val: 555, flag: null }
            }
        };
    }
}
