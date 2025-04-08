struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract NestedOptionalFields {
    opt: OuterOpt;

    init() {
        self.opt = OuterOpt{
            bar: null,
        };
    }
}