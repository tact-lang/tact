struct InnerReq {
    x: Int;
}

struct MiddleOpt {
    r: InnerReq;
}

struct FirstOpt {
    m: MiddleOpt?;
}

contract NestedOptionals {
    storage: FirstOpt;

    init() {
        self.storage = FirstOpt{};
    }
}
