struct DeepNest {
    level1: Int;
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
    level2_val: Int;
}

struct Nested3 {
    val: Int;
    flag: Bool;
}

contract TestContract {
    state: DeepNest;
    init() {
        self.state = DeepNest{
            level1: 1,
            level2: Nested2{
                level2_val: 2,
                level3: Nested3{
                    val: 3,
                    flag: true,
                },
            },
        };
    }
}