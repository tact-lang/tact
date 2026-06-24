struct DeepNest {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    value: Int;
}

contract DeepNestedContract {
    nested: DeepNest;
    init() {
        self.nested = DeepNest{
            level1: Inner1{
                level2: Inner2{ value: 123 }
            }
        };
    }
}
