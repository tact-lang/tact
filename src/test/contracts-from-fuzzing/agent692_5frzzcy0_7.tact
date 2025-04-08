struct DeepOptional {
    nestedOpt: NestedOpt?;
}

struct NestedOpt {
    x: Int;
    y: Bool;
}

contract TestContract {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{
            nestedOpt: null
        };
    }
}