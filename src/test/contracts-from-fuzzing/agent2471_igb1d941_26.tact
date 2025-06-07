struct Inner {
    intVal: Int;
    boolVal: Bool;
}

struct OuterOpt {
    innerOpt: Inner?;
}

contract SetNullNestedOpt {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            innerOpt: null,
        };
    }
}