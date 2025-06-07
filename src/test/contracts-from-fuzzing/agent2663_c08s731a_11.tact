struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

struct RootOpt {
    l1: Level1?;
}

contract NestedOptionalsTest {
    data: RootOpt;

    init() {
        self.data = RootOpt{
            l1: null
        };
    }
}