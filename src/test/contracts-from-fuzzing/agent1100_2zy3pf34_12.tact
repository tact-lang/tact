struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionStruct {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            inner: null
        };
    }
}
