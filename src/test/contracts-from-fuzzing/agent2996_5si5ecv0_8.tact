struct NestedOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: InnerOpt{ foo: null, bar: null }
        };
    }
}