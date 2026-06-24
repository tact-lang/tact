struct NestedMultiLevel {
    x: Int;
    y: String;
}

struct Level2 {
    first: NestedMultiLevel;
    second: NestedMultiLevel;
}

struct Level1 {
    l2_1: Level2;
    l2_2: Level2;
}

contract DeepNestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2_1: Level2{
                first: NestedMultiLevel{ x: 1, y: "a" },
                second: NestedMultiLevel{ x: 2, y: "b" },
            },
            l2_2: Level2{
                first: NestedMultiLevel{ x: 3, y: "c" },
                second: NestedMultiLevel{ x: 4, y: "d" },
            },
        };
    }
}