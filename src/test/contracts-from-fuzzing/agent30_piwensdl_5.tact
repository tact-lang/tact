struct Level3 { 
    deep: Int;
    optDeep: String?;
}

struct Level2 {
    mid: Bool;
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            lvl2: Level2{
                mid: true,
                lvl3: Level3{
                    deep: 42,
                    optDeep: null
                }
            }
        };
    }
}