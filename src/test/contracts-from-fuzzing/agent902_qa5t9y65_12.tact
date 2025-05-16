struct InnerOpt {
    flag: Bool?;
    value: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalInsideOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ flag: null, value: null }
        };
    }
}