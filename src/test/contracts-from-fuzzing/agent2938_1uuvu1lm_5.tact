struct DeepNest {
    next: Level2;
}

struct Level2 {
    next: Level3;
}

struct Level3 {
    next: Level4;
}

struct Level4 {
    val: Int;
}

contract DeepNestedStructTest {
    data: DeepNest;
    init() {
        self.data = DeepNest{
            next: Level2{
                next: Level3{
                    next: Level4{val: 777}
                }
            }
        };
    }
}