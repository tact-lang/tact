struct Inner {
    value: Int;
}

struct Outer {
    innerOpt: Inner?;
}

contract NestedOptionalStruct {
    nested: Outer;

    init() {
        self.nested = Outer{innerOpt: null};
    }
}