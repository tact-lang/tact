struct NestedOptional {
    a: Int?;
    s: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
}

contract NestedOptCont {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            a: null,
            s: null,
        };
    }
}