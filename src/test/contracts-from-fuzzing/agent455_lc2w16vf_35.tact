struct InnerInnerOptional {
    x: Int?;
}

struct InnerOptional {
    inner: InnerInnerOptional?;
}

contract OptionalChain {
    opt: InnerOptional?;

    init() {
        self.opt = InnerOptional{
            inner: null,
        };
    }
}