struct Level3 {
    x: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNestingTest {
    deep: Level1;
    init() {
        self.deep = Level1{
            nested2: Level2{
                nested3: Level3{ x: 42 }
            }
        };
    }
}