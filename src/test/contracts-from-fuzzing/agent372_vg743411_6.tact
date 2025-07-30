struct InnerOptional {
    nestedOpt: Int?;
}

struct OuterOpt {
    inner: InnerOptional?;
}

contract Test {
    field: OuterOpt;
    init() {
        self.field = OuterOpt{
            inner: null
        };
    }
}