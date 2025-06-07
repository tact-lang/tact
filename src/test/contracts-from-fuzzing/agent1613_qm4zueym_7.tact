struct NestedOptionals {
    innerOpt: Int?;
    structOpt: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: String?;
}

contract TestNestedOpts {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            innerOpt: null,
            structOpt: null
        };
    }
}