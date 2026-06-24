struct InnerWithOpt {
    foo: Int?;
}

struct OuterWithOpt {
    bar: InnerWithOpt?;
}

contract NestedOptionStructs {
    top: OuterWithOpt;

    init() {
        self.top = OuterWithOpt{
            bar: InnerWithOpt{ foo: null }
        };
    }
}