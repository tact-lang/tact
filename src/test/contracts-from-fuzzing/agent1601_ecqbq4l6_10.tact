struct Level1 {
    deep: Level2;
}

struct Level2 {
    deep: Level3;
}

struct Level3 {
    deep: Level4;
}

struct Level4 {
    deep: Level5;
}

struct Level5 {
    val: Int;
}

contract DeepNest {
    field: Level1;
    init() {
        self.field = Level1{
            deep: Level2{
                deep: Level3{
                    deep: Level4{
                        deep: Level5{ val: 123 }
                    }
                }
            }
        };
    }
}