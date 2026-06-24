struct NestedOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract Test {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{
            inner: InnerOpt{
                value: null
            }
        };
    }
}