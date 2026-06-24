struct MultiNest {
    a: Int;
    b: InnerLayer;
}

struct InnerLayer {
    flag: Bool;
    data: String?;
}

contract NestedOptionalInside {
    f: MultiNest;

    init() {
        self.f = MultiNest{
            a: 33,
            b: InnerLayer{
                flag: false,
                data: null,
            },
        };
    }
}