struct InnerOpt {
    v: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    v2: Bool?;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            v2: null
        };
    }
}