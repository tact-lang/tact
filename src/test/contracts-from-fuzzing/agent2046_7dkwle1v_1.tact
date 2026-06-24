struct Level3 {
    deepValue: Int;
}

struct Level2 {
    nestedOpt: Level3?;
}

struct Level1 {
    nestedOpt: Level2?;
    value: Int;
}

contract DeepNestedOpt {
    data: Level1;

    init() {
        self.data = Level1{
            nestedOpt: null,
            value: 42
        };
    }
}