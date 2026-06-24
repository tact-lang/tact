struct DeeplyNestedStruct {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: DeeplyNestedStruct;

    init() {
        self.data = DeeplyNestedStruct{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        val1: 99,
                        val2: true,
                    },
                },
            },
        };
    }
}