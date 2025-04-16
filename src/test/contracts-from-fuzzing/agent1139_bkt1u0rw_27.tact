struct InnerDeepOpt {
    a: Int?;
    b: Bool?;
}

struct OuterDeepOpt {
    s1: InnerDeepOpt?;
    s2: InnerDeepOpt;
}

contract DeepOptionalStructs {
    val: OuterDeepOpt?;

    init() {
        self.val = OuterDeepOpt{
            s1: null,
            s2: InnerDeepOpt{ a: null, b: true }
        };
    }
}