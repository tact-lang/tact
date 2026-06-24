struct DeepNest {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    level3: Int as int32;
    optVal: Bool?;
}

contract DeepNestedContract {
    field: DeepNest;

    init() {
        self.field = DeepNest{
            level1: Inner1{
                level2: Inner2{
                    level3: 12345,
                    optVal: null,
                },
            },
        };
    }
}
