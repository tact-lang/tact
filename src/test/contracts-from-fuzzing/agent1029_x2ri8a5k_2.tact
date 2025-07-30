struct DeepNested {
    level1: Int;
    level2: SimpleNested;
}

struct SimpleNested {
    x: Int;
    y: Bool;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level1: 5,
            level2: SimpleNested{x: 42, y: false},
        };
    }
}