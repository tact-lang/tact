struct NestedOptionals {
    innerOpt: Inner?;
}

struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptStruct {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            innerOpt: Inner{
                foo: null,
                bar: null,
            }
        };
    }
}