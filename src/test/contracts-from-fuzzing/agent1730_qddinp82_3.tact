struct InnerMost {
    value: Int;
}

struct MiddleOptional {
    opt: InnerMost?;
}

struct OuterMost {
    deepOpt: MiddleOptional?;
    directOpt: InnerMost?;
}

contract OptionalNestTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            deepOpt: MiddleOptional{ opt: InnerMost{ value: 42 } },
            directOpt: null
        };
    }
}