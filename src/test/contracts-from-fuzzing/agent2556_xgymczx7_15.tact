struct OuterOptional {
    a: Int?;
    b: InnerOptional?;
}

struct InnerOptional {
    c: Int?;
    d: InnerInnerOptional?;
}

struct InnerInnerOptional {
    e: Int?;
}

contract OptionalChainContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            a: null,
            b: null
        };
    }
}
