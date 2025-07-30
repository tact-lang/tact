struct DeepOpt {
    opt: MiddleOpt?;
}

struct MiddleOpt {
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
}

contract DeepOptionalContract {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            opt: MiddleOpt{
                nestedOpt: InnerOpt{
                    flag: true
                }
            }
        };
    }
}