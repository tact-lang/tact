struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract TestContract {
    baz: OuterOpt?;

    init() {
        self.baz = OuterOpt{
            bar: InnerOpt{
                foo: 123
            }
        };
    }
}