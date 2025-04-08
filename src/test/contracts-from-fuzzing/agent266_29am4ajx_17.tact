struct InnerWithOpt {
    foo: Int?;
}

struct MiddleWithOpt {
    iw: InnerWithOpt?;
}

contract OptInOptInStruct {
    data: MiddleWithOpt;

    init() {
        self.data = MiddleWithOpt{
            iw: null
        };
    }
}