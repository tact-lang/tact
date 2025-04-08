struct InnerOpt {
    x: Int?;
}

struct OuterMix {
    inner: InnerOpt?;
    flag: Bool?;
    count: Int?;
}

contract NestedNulls {
    state: OuterMix;

    init() {
        self.state = OuterMix{
            inner: null,
            flag: true,
            count: null,
        };
    }
}