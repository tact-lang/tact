struct Level3 {
    val: Int?;
}

struct Level2 {
    nestedLvl3: Level3;
    flag: Bool?;
}

struct Level1 {
    nestedLvl2: Level2;
    score: Int;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            nestedLvl2: Level2{
                nestedLvl3: Level3{ val: null },
                flag: false
            },
            score: 100
        };
    }
}
