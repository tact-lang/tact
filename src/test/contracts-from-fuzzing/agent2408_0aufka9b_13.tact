struct SDeepOpt {
    inner: Int?;
}

struct SOuterOpt {
    innerStruct: SDeepOpt?;
}

contract OptionalStructLayered {
    val: SOuterOpt;

    init() {
        self.val = SOuterOpt{
            innerStruct: null,
        };
    }
}