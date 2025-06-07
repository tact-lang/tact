struct InnerOpt {
    v: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    s: String?;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            s: null
        };
    }
}