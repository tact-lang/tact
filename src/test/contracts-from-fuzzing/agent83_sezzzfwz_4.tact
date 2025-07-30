struct NestedOptional {
    innerOpt: Int?;
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    value: NestedOptional;

    init() {
        self.value = NestedOptional{
            innerOpt: null,
            nestedOpt: null
        };
    }
}