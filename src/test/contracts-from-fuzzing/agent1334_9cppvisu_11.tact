struct InnerOpt {
    optBool: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}
