struct InnerOpt {
    data: String?;
    count: Int?;
}

struct OuterOpt {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

contract OptionalStructs {
    store: OuterOpt;
    init() {
        self.store = OuterOpt{
            inner1: null,
            inner2: null
        };
    }
}