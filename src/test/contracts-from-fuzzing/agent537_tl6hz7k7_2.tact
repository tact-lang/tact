struct DeepNested {
    level1: Int;
    level2: Nested;
}

struct Nested {
    innerVal: Int;
    innerOpt: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 1,
            level2: Nested{ innerVal: 2, innerOpt: 3 }
        };
    }

    receive() {
        self.data = DeepNested{
            level1: 10,
            level2: Nested{ innerVal: 20, innerOpt: null }
        };
    }
}
