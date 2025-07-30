struct InnerOpt {
    i: Int?;
}

struct OuterOpt {
    s: InnerOpt?;
}

contract NestedNulls {
    f: OuterOpt?;
    init() {
        self.f = OuterOpt{
            s: null
        };
    }
}