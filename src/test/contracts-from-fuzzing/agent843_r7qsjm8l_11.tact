struct InnerWithOptional {
    f1: Int?;
    f2: Bool?;
}

struct OuterWithInnerOpt {
    inner: InnerWithOptional;
}

contract CombineOptStruct {
    obj: OuterWithInnerOpt;

    init() {
        self.obj = OuterWithInnerOpt{
            inner: InnerWithOptional{ f1: null, f2: null }
        };
    }
}