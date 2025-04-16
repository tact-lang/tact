struct InnerOpt {
    s: String?;
    n: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    val: Int;
}

contract OptionalInOptional {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                s: null,
                n: 10,
                b: true,
            },
            val: 3,
        };
    }
}
