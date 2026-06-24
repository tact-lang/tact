struct InnerBool {
    flag: Bool;
}

struct MiddleOpt {
    inner: InnerBool?;
}

contract OptionalBoolNest {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{
            inner: InnerBool{flag:true}
        };
    }
}
