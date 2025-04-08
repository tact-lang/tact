struct InnerOpt {
    v: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}
