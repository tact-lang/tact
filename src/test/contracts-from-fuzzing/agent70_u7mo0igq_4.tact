struct NestedOptional {
    innerOpt: Inner?;
}

struct Inner {
    boolVal: Bool;
    intVal: Int;
}

contract TestContract {
    nestedOptField: NestedOptional;

    init() {
        self.nestedOptField = NestedOptional{
            innerOpt: null
        };
    }
}