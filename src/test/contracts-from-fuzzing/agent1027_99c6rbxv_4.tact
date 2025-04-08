struct InnerOpt {
    val1: Int?;
    val2: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    count: Int?;
    flag: Bool?;
}

contract OptionalDeep {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            count: null,
            flag: null
        };
    }
}
