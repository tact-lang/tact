struct Level3 {
    leaf: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    leaf: 99,
                },
            },
        };
    }
}