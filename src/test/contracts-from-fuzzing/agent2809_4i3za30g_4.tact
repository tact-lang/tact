struct Level3 {
    x: Int = 9;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNested {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{
                    x: 555
                }
            }
        };
    }
}