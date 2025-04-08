struct InnerOpt {
    maybeInt: Int?;
    maybeBool: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptInOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}