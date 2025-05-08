struct DeepNest {
    n1: Int;
    n2: Bool;
    n3: NestedOptional;
}

struct NestedOptional {
    inner1: Int?;
    inner2: Bool?;
}

contract TestContract {
    field: DeepNest;

    init() {
        self.field = DeepNest{
            n1: 5,
            n2: false,
            n3: NestedOptional{
                inner1: null,
                inner2: true,
            },
        };
    }
}