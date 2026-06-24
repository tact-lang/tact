struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalStruct {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            inner: null
        };
    }
}