struct InnerOpt {
    val: Int?;
}

struct MiddleOpt {
    nested: InnerOpt?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            middle: null,
        };
    }
}