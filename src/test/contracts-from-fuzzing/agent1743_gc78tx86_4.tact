struct InnerOpt {
    flag: Bool;
    comment: String?;
}

struct OuterOpt {
    desc: String;
    inner: InnerOpt?;
    intValue: Int?;
}

contract OptionalNest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            desc: "desc",
            inner: null,
            intValue: null,
        };
    }
}