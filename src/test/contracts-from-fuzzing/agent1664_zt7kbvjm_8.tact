struct InnerMost {
    secret: String;
}

struct MiddleOpt {
    data: InnerMost?;
}

struct Outer {
    wrapper: MiddleOpt?;
}

contract FullDeepNestedOpt {
    nested: Outer?;

    init() {
        self.nested = Outer{
            wrapper: MiddleOpt{
                data: InnerMost{
                    secret: "shhh"
                }
            }
        };
    }
}