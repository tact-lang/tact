struct InnerOpt {
    s: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionalStruct {
    field: OuterOpt;
    init() {
        self.field = OuterOpt{
            inner: null
        };
    }
}