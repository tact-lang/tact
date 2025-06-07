struct NestedOpt {
    inner: Int?;
}

struct OuterOpt {
    a: Int;
    innerOpt: NestedOpt?;
}

contract OptStructs {
    param: OuterOpt;

    init() {
        self.param = OuterOpt{
            a: 5,
            innerOpt: null,
        };
    }
}
