struct NestedOptional {
    nestedOpt: Level1?;
}

struct Level1 {
    innerOpt: Level2?;
}

struct Level2 {
    val: Int;
}

contract NestedOptionalsTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            nestedOpt: null
        };
    }
}