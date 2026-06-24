struct DeepOptionalNest {
    inner: DeepLevel?;
}

struct DeepLevel {
    intVal: Int;
    boolVal: Bool?;
}

contract NestedOptionalsExample {
    field: DeepOptionalNest;

    init() {
        self.field = DeepOptionalNest{
            inner: DeepLevel{
                intVal: 123,
                boolVal: null,
            },
        };
    }
}