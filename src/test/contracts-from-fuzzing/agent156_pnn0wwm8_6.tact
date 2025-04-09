struct InnerOpt {
    flag: Bool?;
    value: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    count: Int;
}

contract NestedOptionalFields {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ flag: null, value: 5 },
            count: 42
        };
    }
}
