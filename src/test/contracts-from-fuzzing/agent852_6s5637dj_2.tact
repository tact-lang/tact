struct Level3 {
    data3: Int;
}

struct Level2 {
    data2: Level3;
}

struct Level1 {
    data1: Level2;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            data1: Level2{
                data2: Level3{
                    data3: 10
                }
            }
        };
    }
}