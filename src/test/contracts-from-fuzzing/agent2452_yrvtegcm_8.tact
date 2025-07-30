struct Level3 {
    deepVal: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNesting {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{
                    deepVal: 123
                }
            }
        };
    }
}