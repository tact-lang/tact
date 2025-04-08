struct NestedOptionals {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool;
}

contract NestedOptionalFields {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            innerOpt: InnerOpt{
                foo: null,
                bar: false
            }
        };
    }
}