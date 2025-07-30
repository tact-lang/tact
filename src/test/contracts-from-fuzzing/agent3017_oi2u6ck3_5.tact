struct NestedOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract Test {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: null
        };
    }
}
