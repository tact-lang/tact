// optional struct inside optional struct inside contract
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    s: String?;
}

contract NestedOptionStructs {
    field: OuterOpt?;

    init() {
        self.field = OuterOpt{
            inner: InnerOpt{
                a: null,
                b: null
            },
            s: null
        };
    }
}
