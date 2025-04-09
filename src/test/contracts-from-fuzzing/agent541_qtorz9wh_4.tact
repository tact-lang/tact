struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    val: Int?;
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        val: null,
                        flag: true,
                    },
                },
            },
        };
    }

    receive() {
        self.data = self.data;
    }
}