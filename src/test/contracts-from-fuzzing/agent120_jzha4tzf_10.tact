struct InnerOpt {
    foo: Int;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract NestedOptionalsContract {
    baz: OuterOpt?;

    init() {
        self.baz = null;
    }

    receive() {
        self.baz = OuterOpt{
            bar: InnerOpt{ foo: 77 }
        };
    }
}